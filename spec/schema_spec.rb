require 'rubygems'
require 'spec'

$: << File.expand_path(File.join(File.dirname(__FILE__),"..","lib"))
require 'amalgalite'
require 'amalgalite/schema'

describe Amalgalite::Schema do
  before(:each) do
    @schema = IO.read( SpecInfo.test_schema_file )
    @iso_db_file = SpecInfo.make_iso_db
    @iso_db = Amalgalite::Database.new( SpecInfo.make_iso_db )
  end

  after(:each) do
    File.unlink SpecInfo.test_db if File.exist?( SpecInfo.test_db )
    @iso_db.close
    File.unlink @iso_db_file if File.exist?( @iso_db_file )
  end

  it "loads the schema of a database" do
    schema = @iso_db.schema
    schema.load_tables
    schema.tables.size.should eql(2)
  end

  it "lazily loads new table schema" do
    @iso_db.schema.tables.size.should eql(2)
    sql = "CREATE TABLE t1 ( a, b, c )"
    @iso_db.execute( sql )
    @iso_db.schema.tables.size.should eql(2)
    @iso_db.schema.dirty!
    @iso_db.schema.tables['t1'].column_names.should eql(%w[ a b c ])
    @iso_db.schema.tables.size.should eql(3)
  end

  it "loads the views in the database" do
    sql = "CREATE VIEW v1 AS SELECT c.name, c.two_letter, s.name, s.subdivision FROM country AS c JOIN subcountry AS s ON c.two_letter = s.country"
    @iso_db.execute( sql )
    @iso_db.schema.load_views
    @iso_db.schema.views.size.should eql(1)
    @iso_db.schema.views["v1"].sql.should eql(sql)
  end

  it "removes quotes from around default values in columns" do
    sql = "CREATE TABLE t1( d1 default 't' )"
    @iso_db.execute( sql )
    @iso_db.schema.dirty!
    tt = @iso_db.schema.tables['t1']
    tt.columns['d1'].default_value.should == "t"
  end

  it "loads the tables and columns" do
    ct = @iso_db.schema.tables['country']
    ct.name.should eql("country")
    ct.columns.size.should eql(3)
    ct.indexes.size.should eql(2)
    ct.column_names.should eql(%w[ name two_letter id ])
    @iso_db.schema.tables.size.should eql(2)


    ct.columns['two_letter'].should be_primary_key
    ct.columns['two_letter'].declared_data_type.should eql("TEXT")
    ct.columns['name'].should_not be_nullable
    ct.columns['name'].should be_not_null_constraint
    ct.columns['name'].should_not be_has_default_value
    ct.columns['id'].should_not be_auto_increment
  end

  it "knows what the primary key of a table is" do
    ct = @iso_db.schema.tables['country']
    ct.primary_key.should == [ ct.columns['two_letter'] ]
  end

  it "knows the primary key of a table even without an explicity unique index" do
    sql = "CREATE TABLE u( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , other text )"
    @iso_db.execute( sql )
    @iso_db.schema.dirty!
    ut = @iso_db.schema.tables['u']
    ut.primary_key.should == [ ut.columns['id'] ]
  end

  it "knows the primary key of a temporary table" do
    @iso_db.execute "CREATE TEMPORARY TABLE tt( a, b INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, c )"
    @iso_db.schema.dirty!
    tt = @iso_db.schema.load_table( 'tt' )
    tt.primary_key.should == [ tt.columns['b'] ]

  end

  it "knows what the primary key of a table is when it is a multiple column primary key" do
    sql = "CREATE TABLE m ( id1, id2, PRIMARY KEY (id2, id1) )"
    @iso_db.execute( sql )
    @iso_db.schema.dirty!
    mt = @iso_db.schema.tables['m']
    mt.primary_key.should == [ mt.columns['id2'], mt.columns['id1'] ]
  end

  it "loads the indexes" do
    c = @iso_db.schema.tables['country']
    c.indexes.size.should eql(2)
    c.indexes['country_name'].columns.size.should eql(1)
    c.indexes['country_name'].should_not be_unique
    c.indexes['country_name'].sequence_number.should eql(0)
    c.indexes['country_name'].columns.first.should eql(@iso_db.schema.tables['country'].columns['name'])
    c.indexes['sqlite_autoindex_country_1'].should be_unique

    subc = @iso_db.schema.tables['subcountry']
    subc.indexes.size.should eql(3)
    subc.indexes['subcountry_country'].columns.first.should eql(@iso_db.schema.tables['subcountry'].columns['country'])
  end

  it "can load the schema of a temporary table" do
    @iso_db.execute "CREATE TEMPORARY TABLE tt( a, b, c )"
    @iso_db.schema.dirty!
    @iso_db.schema.tables['tt'].should be_nil
    @iso_db.schema.load_table('tt').should_not be_nil
    @iso_db.schema.tables['tt'].should be_temporary
  end
end
