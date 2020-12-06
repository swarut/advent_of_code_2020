defmodule Day5 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"], trim: true)
    |> Enum.map(fn line ->
      ~r/(?<row>[F|B]{7})(?<col>[L|R]{3})/ |> Regex.named_captures(line)
    end)
  end

  def solve_part1() do
    get_input() |>
    Enum.map(fn %{"row" => row, "col" => col} ->
      row = String.split(row, "", trim: true)
      col = String.split(col, "", trim: true)
      seat_id(parse_row(row), parse_column(col))
    end)
    |> Enum.max
  end

  def seat_id(row, column) do
    (row * 8) + column
  end

  def parse_row(code) do
    parse(code, {0, 127})
  end

  def parse_column(code) do
    parse(code, {0, 7})
  end

  def parse([], {l, u}) when l == u do
    l
  end

  def parse([h | t], {l, u}) when h == "F" or h == "L" do
    u = u - div((u + 1) - l, 2)
    parse(t, {l, u})
  end

  def parse([h | t], {l, u}) when h == "B" or h == "R" do
    l = l + div((u + 1) - l, 2)
    parse(t, {l, u})
  end

end
