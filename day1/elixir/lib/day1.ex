defmodule Day1 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, "\n", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def solve_part1 do
    input = get_input()
    pair = find_sum_pair(2020, input, %{})
    {a, b} = pair
    a * b
  end

  def find_sum_pair(sum, [h | t], lookup) do
    case lookup[sum - h] do
      nil -> find_sum_pair(sum, t, Map.put(lookup, h, sum - h))
      _ -> {h, sum - h}
    end
  end

  def find_sum_pair(_sum, [], _lookup) do
    nil
  end

  def solve_part2 do
    input = get_input()
    result = find_three_numbers_with_sum(2020, input)
    {a, b, c} = result
    a * b * c
  end

  def find_three_numbers_with_sum(sum, [h | t]) do
    next_sum = sum - h
    pair = find_sum_pair(next_sum, t, %{})
    case pair do
      nil -> find_three_numbers_with_sum(sum, t)
      {a, b} -> {a, b, h}
    end
  end

end
