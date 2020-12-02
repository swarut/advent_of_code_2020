defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "parse() extracts the data into a map" do
    assert Day2.parse("3-4 c: cccc") == %{"min" => "3", "max" => "4", "char" =>"c", "text" => "cccc"}
  end

  test "validate() returns true if the text follows the rule" do
    assert Day2.validate(%{"min" => "3", "max" => "4", "char" =>"c", "text" => "cccc"}) == true
  end

  test "validate() returns true if the text does not follow the rule" do
    assert Day2.validate(%{"min" => "6", "max" => "7", "char" =>"c", "text" => "cccc"}) == false
  end

  test "validate_part2() returns true if the text follows the rule" do
    assert Day2.validate_part2(%{"min" => "1", "max" => "3", "char" =>"a", "text" => "abcde"}) == true
  end

  test "validate_part2() returns true if the text does not follow the rule" do
    assert Day2.validate_part2(%{"min" => "1", "max" => "3", "char" =>"b", "text" => "cdefg"}) == false
    assert Day2.validate_part2(%{"min" => "2", "max" => "9", "char" =>"c", "text" => "ccccccccc"}) == false
    assert Day2.validate_part2(%{"min" => "4", "max" => "6", "char" =>"c", "text" => "cccxcjcwc"}) == false
    assert Day2.validate_part2(%{"min" => "3", "max" => "8", "char" =>"p", "text" => "pppppppppppp"}) == false
  end
end
