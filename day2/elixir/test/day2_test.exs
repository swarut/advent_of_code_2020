defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "parse() extracts the data into a map" do
    assert Day2.parse("3-4 c: cccc") == %{"min" => "3", "max" => "4", "char" =>"c", "text" => "cccc"}
  end

  test "validate() returns true if the text follows the rule" do
    assert Day2.validate(%{"min" => "3", "max" => "4", "char" =>"c", "text" => "cccc"}) == true
  end

  test "validate() returns true if the text follows the false" do
    assert Day2.validate(%{"min" => "6", "max" => "7", "char" =>"c", "text" => "cccc"}) == false
  end
end
