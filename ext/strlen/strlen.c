#include <ruby.h>

static VALUE
rb_strlen(VALUE mod, VALUE str)
{
    return LONG2NUM(strlen(StringValueCStr(str)));
}

void Init_strlen(void)
{
    VALUE rb_mStrlen = rb_define_module("Strlen");
    rb_define_module_function(rb_mStrlen, "strlen", rb_strlen, 1);
}
