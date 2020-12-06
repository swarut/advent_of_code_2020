defmodule Day5Test do
  use ExUnit.Case

  test "parse_row()" do
    assert Day5.parse_row("FBFBBFF" |> String.split("", trim: true)) == 44
  end

  test "parse_column()" do
    assert Day5.parse_column("RLR" |> String.split("", trim: true)) == 5
  end

  test "seat_id()" do
    assert Day5.seat_id(44, 5) == 357
  end
end
