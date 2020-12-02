defmodule Day2 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"], trim: true)
  end

  def solve_part1() do
    metas = get_input()
      |> Enum.map(fn x -> parse(x) |> validate end)
      |> Enum.filter(fn x -> x end)
    IO.puts metas |> Enum.count
  end

  def parse(text) do
    Regex.named_captures(~r/(?<min>\d+)-(?<max>\d+) (?<char>\w): (?<text>\w+)/, text)
  end

  def validate(%{"min" => min, "max" => max, "char" => char, "text" => text}) do
    char_count = String.length(text) - String.length(text |> String.replace(char, ""))
    (char_count >= String.to_integer(min)) && (char_count <= String.to_integer(max))
  end
end
