defmodule Day3 do
  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"], trim: true)
  end

  def solve_part1() do
    map = get_input()
    dimension = %{width: map |> List.first |> String.length, height: map |> Enum.count }
    steps = %{right: 3, down: 1}
    traverse(map, dimension, steps, 0, 0, 0)
  end

  def solve_part2() do
    map = get_input()
    dimension = %{width: map |> List.first |> String.length, height: map |> Enum.count }
    count1 = traverse(map, dimension, %{right: 1, down: 1}, 0, 0, 0)
    count2 = traverse(map, dimension, %{right: 3, down: 1}, 0, 0, 0)
    count3 = traverse(map, dimension, %{right: 5, down: 1}, 0, 0, 0)
    count4 = traverse(map, dimension, %{right: 7, down: 1}, 0, 0, 0)
    count5 = traverse(map, dimension, %{right: 1, down: 2}, 0, 0, 0)
    count1 * count2 * count3 * count4 * count5
  end

  def traverse(_map, %{width: _width, height: height}, _steps, _last_x, last_y, tree_count) when last_y == (height - 1) do
    tree_count
  end

  def traverse(map, dimension = %{width: width}, steps = %{right: step_right, down: step_down},  last_x, last_y, tree_count) do
    new_y = last_y + step_down
    new_x = rem((last_x + step_right), width)
    pane = map |> Enum.at(new_y)
    case String.at(pane, new_x) do
      "#" -> traverse(map, dimension, steps, new_x, new_y, tree_count + 1)
      _ -> traverse(map, dimension, steps, new_x, new_y, tree_count)
    end
  end
end
