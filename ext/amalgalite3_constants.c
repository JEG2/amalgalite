/* Generated code do not edit */

#include "amalgalite3.h";
void am_define_constants_under(VALUE module)
{
    VALUE mC = rb_define_module_under(module, "Constants");

    VALUE mC_Open = rb_define_module_under(mC, "Open");
    rb_define_const(mC_Open, "READWRITE", INT2FIX(SQLITE_OPEN_READWRITE));
    rb_define_const(mC_Open, "READONLY", INT2FIX(SQLITE_OPEN_READONLY));
    rb_define_const(mC_Open, "CREATE", INT2FIX(SQLITE_OPEN_CREATE));

    VALUE mC_ResultCode = rb_define_module_under(mC, "ResultCode");
    rb_define_const(mC_ResultCode, "IOERR_RDLOCK", INT2FIX(SQLITE_IOERR_RDLOCK));
    rb_define_const(mC_ResultCode, "RANGE", INT2FIX(SQLITE_RANGE));
    rb_define_const(mC_ResultCode, "CONSTRAINT", INT2FIX(SQLITE_CONSTRAINT));
    rb_define_const(mC_ResultCode, "IOERR_BLOCKED", INT2FIX(SQLITE_IOERR_BLOCKED));
    rb_define_const(mC_ResultCode, "NOTADB", INT2FIX(SQLITE_NOTADB));
    rb_define_const(mC_ResultCode, "FORMAT", INT2FIX(SQLITE_FORMAT));
    rb_define_const(mC_ResultCode, "AUTH", INT2FIX(SQLITE_AUTH));
    rb_define_const(mC_ResultCode, "SCHEMA", INT2FIX(SQLITE_SCHEMA));
    rb_define_const(mC_ResultCode, "NOLFS", INT2FIX(SQLITE_NOLFS));
    rb_define_const(mC_ResultCode, "EMPTY", INT2FIX(SQLITE_EMPTY));
    rb_define_const(mC_ResultCode, "PROTOCOL", INT2FIX(SQLITE_PROTOCOL));
    rb_define_const(mC_ResultCode, "IOERR", INT2FIX(SQLITE_IOERR));
    rb_define_const(mC_ResultCode, "READONLY", INT2FIX(SQLITE_READONLY));
    rb_define_const(mC_ResultCode, "IOERR_SHORT_READ", INT2FIX(SQLITE_IOERR_SHORT_READ));
    rb_define_const(mC_ResultCode, "LOCKED", INT2FIX(SQLITE_LOCKED));
    rb_define_const(mC_ResultCode, "BUSY", INT2FIX(SQLITE_BUSY));
    rb_define_const(mC_ResultCode, "IOERR_DELETE", INT2FIX(SQLITE_IOERR_DELETE));
    rb_define_const(mC_ResultCode, "IOERR_READ", INT2FIX(SQLITE_IOERR_READ));
    rb_define_const(mC_ResultCode, "ROW", INT2FIX(SQLITE_ROW));
    rb_define_const(mC_ResultCode, "NOTFOUND", INT2FIX(SQLITE_NOTFOUND));
    rb_define_const(mC_ResultCode, "IOERR_FSYNC", INT2FIX(SQLITE_IOERR_FSYNC));
    rb_define_const(mC_ResultCode, "MISUSE", INT2FIX(SQLITE_MISUSE));
    rb_define_const(mC_ResultCode, "TOOBIG", INT2FIX(SQLITE_TOOBIG));
    rb_define_const(mC_ResultCode, "ABORT", INT2FIX(SQLITE_ABORT));
    rb_define_const(mC_ResultCode, "DONE", INT2FIX(SQLITE_DONE));
    rb_define_const(mC_ResultCode, "CORRUPT", INT2FIX(SQLITE_CORRUPT));
    rb_define_const(mC_ResultCode, "OK", INT2FIX(SQLITE_OK));
    rb_define_const(mC_ResultCode, "MISMATCH", INT2FIX(SQLITE_MISMATCH));
    rb_define_const(mC_ResultCode, "CANTOPEN", INT2FIX(SQLITE_CANTOPEN));
    rb_define_const(mC_ResultCode, "INTERRUPT", INT2FIX(SQLITE_INTERRUPT));
    rb_define_const(mC_ResultCode, "INTERNAL", INT2FIX(SQLITE_INTERNAL));
    rb_define_const(mC_ResultCode, "IOERR_UNLOCK", INT2FIX(SQLITE_IOERR_UNLOCK));
    rb_define_const(mC_ResultCode, "IOERR_FSTAT", INT2FIX(SQLITE_IOERR_FSTAT));
    rb_define_const(mC_ResultCode, "IOERR_DIR_FSYNC", INT2FIX(SQLITE_IOERR_DIR_FSYNC));
    rb_define_const(mC_ResultCode, "FULL", INT2FIX(SQLITE_FULL));
    rb_define_const(mC_ResultCode, "ERROR", INT2FIX(SQLITE_ERROR));
    rb_define_const(mC_ResultCode, "IOERR_NOMEM", INT2FIX(SQLITE_IOERR_NOMEM));
    rb_define_const(mC_ResultCode, "IOERR_WRITE", INT2FIX(SQLITE_IOERR_WRITE));
    rb_define_const(mC_ResultCode, "NOMEM", INT2FIX(SQLITE_NOMEM));
    rb_define_const(mC_ResultCode, "PERM", INT2FIX(SQLITE_PERM));
    rb_define_const(mC_ResultCode, "IOERR_TRUNCATE", INT2FIX(SQLITE_IOERR_TRUNCATE));

    VALUE mC_DataType = rb_define_module_under(mC, "DataType");
    rb_define_const(mC_DataType, "INTEGER", INT2FIX(SQLITE_INTEGER));
    rb_define_const(mC_DataType, "TEXT", INT2FIX(SQLITE_TEXT));
    rb_define_const(mC_DataType, "NULL", INT2FIX(SQLITE_NULL));
    rb_define_const(mC_DataType, "BLOB", INT2FIX(SQLITE_BLOB));
    rb_define_const(mC_DataType, "FLOAT", INT2FIX(SQLITE_FLOAT));
}
