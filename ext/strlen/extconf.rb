require "mkmf"

abort unless have_func("strlen")

create_makefile "strlen"
