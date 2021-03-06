require 'rubygems'
require 'amalgalite/version'
require 'tasks/config'

Amalgalite::GEM_SPEC = Gem::Specification.new do |spec|
  proj = Configuration.for('project')
  spec.name         = proj.name
  spec.version      = Amalgalite::VERSION
  
  spec.author       = proj.author
  spec.email        = proj.email
  spec.homepage     = proj.homepage
  spec.summary      = proj.summary
  spec.description  = proj.description
  spec.platform     = Gem::Platform::RUBY

  
  pkg = Configuration.for('packaging')
  spec.files        = pkg.files.all
  spec.executables  = pkg.files.bin.collect { |b| File.basename(b) }

  # add dependencies here
  spec.add_dependency("arrayfields", "~> 4.7.0")
  
  spec.add_development_dependency("rake", "~> 0.8.4")
  spec.add_development_dependency("configuration", "~> 0.0.5")
  spec.add_development_dependency("rspec", "~> 1.2.2")

  if ext_conf = Configuration.for_if_exist?("extension") then
    spec.extensions <<  ext_conf.configs
    spec.extensions.flatten!
  end
  
  if rdoc = Configuration.for_if_exist?('rdoc') then
    spec.has_rdoc         = true
    spec.extra_rdoc_files = pkg.files.rdoc
    spec.rdoc_options     = rdoc.options + [ "--main" , rdoc.main_page ]
  else
    spec.has_rdoc         = false
  end 

  if test = Configuration.for_if_exist?('testing') then
    spec.test_files       = test.files
  end 

  if rf = Configuration.for_if_exist?('rubyforge') then
    spec.rubyforge_project  = rf.project
  end 
end

Amalgalite::GEM_SPEC_WIN = Amalgalite::GEM_SPEC.clone
Amalgalite::GEM_SPEC_WIN.platform = ::Gem::Platform.new( "i386-mswin32_60" )
Amalgalite::GEM_SPEC_WIN.extensions = []
Amalgalite::GEM_SPEC_WIN.files +=  ["lib/amalgalite3.so"]

Amalgalite::SPECS = [ Amalgalite::GEM_SPEC, Amalgalite::GEM_SPEC_WIN ]
