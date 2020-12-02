defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "find_sum_pair returns a pair of number which their sum is 2020" do
    input = [1, 2, 3, 2020, 2018, 10]
    assert Day1.find_sum_pair(2020, input, %{}) == {2018, 2}
  end

  test "find_three_numbers_with_sum returns three numbers which their sum is 2020" do
    input = [1, 2, 3, 2020, 2018, 10, 2017]
    assert Day1.find_three_numbers_with_sum(2020, input) == {2017, 2, 1}
  end
end
