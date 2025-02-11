require "helper"

class TheTest < StrlenTest
  def test_works
    assert_equal 3, Strlen.strlen("foo")
  end
end
