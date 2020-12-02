defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "find_2020_sum_pair returns a pair of number which their sum is 2020" do
    input = [1, 2, 3, 2020, 2018, 10]
    assert Day1.find_2020_sum_pair(input, %{}) == {2018, 2}
  end
end
