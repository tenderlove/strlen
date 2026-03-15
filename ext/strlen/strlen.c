#include <ruby.h>
#include <string.h>

__attribute__((used))
static VALUE
rb_strlen_impl(VALUE mod, VALUE str)
{
    return LONG2NUM(strlen(StringValueCStr(str)));
}

// Trampoline registered with rb_define_method
__attribute__((naked, aligned(16)))
static VALUE rb_strlen(VALUE self, VALUE str) {
__asm__(
 "b _rb_strlen_impl\n"            // 4 bytes: tail call (skips data)
 ".long 0x46464930\n"              // 4 bytes: magic "FFI0"
 ".byte 1\n"                       // param_count
 ".byte 3\n"                       // param_types[0] = string
 ".byte 5\n"                       // return_type = size_t
 ".asciz \"strlen\"\n"             // native function name
);
}


void Init_strlen(void)
{
    VALUE rb_mStrlen = rb_define_module("Strlen");
    rb_define_module_function(rb_mStrlen, "strlen_no_hints", rb_strlen_impl, 1);
    rb_define_module_function(rb_mStrlen, "strlen", rb_strlen, 1);
}
