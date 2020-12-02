defmodule Day1 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, "\n", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def solve_part1 do
    input = get_input()
    pair = find_2020_sum_pair(input, %{})
    {a, b} = pair
    a * b
  end

  def find_2020_sum_pair([h | t], lookup) do
    case lookup[2020 - h] do
      nil -> find_2020_sum_pair(t, Map.put(lookup, h, 2020 - h))
      _ -> {h, 2020 - h}
    end
  end
end
