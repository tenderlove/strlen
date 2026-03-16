# frozen_string_literal: true

require "strlen"
require "ffi"
require "benchmark/ips"

module A
  extend FFI::Library
  ffi_lib 'c'
  attach_function :strlen, [:string], :int
end

module B
  # "Ruby" implementation of strlen
  def self.strlen(x)
    x.bytesize
  end
end

str = "foo"

def ruby(str); B.strlen str; end
def ffi(str); A.strlen str; end
def c_ext(str); Strlen.strlen_no_hints str; end
def jit_hints(str); Strlen.strlen str; end

Benchmark.ips do |x|
  x.report("strlen-ffi")  { ffi(str)  } # strlen via FFI
  x.report("strlen-ruby") { ruby(str) } # high watermark
  x.report("strlen-cext") { c_ext(str) } # C ext
  x.report("strlen-zjit") { jit_hints(str) }
  x.compare!
end
