defmodule Day4 do
  @required_fields MapSet.new(~w(byr iyr eyr hgt hcl ecl pid))

  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"])
  end

  def solve_part1() do
    input = get_input()
    count_valid_passport(input, MapSet.new(), 0)
  end

  def count_valid_passport([], passport_memo, count) do
    case MapSet.equal?(@required_fields, passport_memo |> MapSet.delete("cid")) do
      true -> count + 1
      false -> count
    end
  end

  def count_valid_passport(["" | t], passport_memo, count) do
    # validate
    case MapSet.equal?(@required_fields, passport_memo |> MapSet.delete("cid")) do
      true -> count_valid_passport(t, MapSet.new(), count + 1)
      false -> count_valid_passport(t, MapSet.new(), count)
    end
  end

  def count_valid_passport([h | t], passport_memo = %MapSet{}, count) do
    # build up
    tokens = h |> String.split(" ")
    passport_memo = tokens
      |> Enum.reduce(passport_memo, fn token, acc ->
        key = ~r/\w\w\w:/
          |> Regex.run(token)
          |> List.first
          |> String.slice(0, 3)
        acc |> MapSet.put(key)
      end)
    count_valid_passport(t, passport_memo, count)
  end

end
