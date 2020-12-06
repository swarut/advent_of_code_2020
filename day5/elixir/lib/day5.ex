defmodule Day5 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"], trim: true)
    |> Enum.map(fn line ->
      ~r/(?<row>[F|B]{7})(?<col>[L|R]{3})/ |> Regex.named_captures(line)
    end)
  end

  def solve_part1() do
    list_all_seat_ids() |> Enum.max
  end

  def solve_part2() do
    list_all_seat_ids()
  end

  def list_all_seat_ids() do
    get_input() |>
    Enum.map(fn %{"row" => row, "col" => col} ->
      row = String.split(row, "", trim: true)
      col = String.split(col, "", trim: true)
      seat_id(parse_row(row), parse_column(col))
    end)
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

  def seat_number_diff(seats) do
    seats = Enum.sort(seats)
    [_ | shifted_seats] = seats
    seat_number_diff(seats, shifted_seats, [])
  end

  def seat_number_diff([_h], [], acc) do
    acc
  end

  def seat_number_diff([h | t], [shifted_h | shifted_t], acc) do
    d = shifted_h - h
    # Answer with the seat between d == 2.
    IO.puts("d = #{d} h = #{h}, shifted_h = #{shifted_h}")
    seat_number_diff(t, shifted_t, [(shifted_h - h) | acc])
  end

end
