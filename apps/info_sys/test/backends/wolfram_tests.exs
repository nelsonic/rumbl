defmodule InfoSys.Backends.WolframTest do
  use ExUnit.Case, async: true

  test "makes request, reports results, then terminates" do
    actual = hd InfoSys.compute("1 + 1", [])
    assert actual.text == "2"
  end

  test "no query results reports an empty list" do
    assert InfoSys.compute("none", [])
  end
end
