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
  def self.strlen(x)
    # bytesize is cached, so not really a "comparison"
    # It just gives us a high watermark for performance.
    # This test only shows us the cost of pushing a frame
    x.bytesize
  end
end

str = "foo"

Benchmark.ips do |x|
  x.report("strlen-ffi")  { A.strlen(str) } # strlen via FFI
  x.report("strlen-ruby") { B.strlen(str) } # high watermark
  x.report("strlen-cext") { Strlen.strlen_no_hints(str) } # C ext
  x.report("ruby-direct") { str.bytesize }
  x.report("strlen-zjit") { Strlen.strlen(str) }
  x.compare!
end
