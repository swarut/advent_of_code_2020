defmodule Day4 do
  @required_fields MapSet.new(~w(byr iyr eyr hgt hcl ecl pid))

  def get_input do
    {:ok, result} = File.read("input.txt")

    String.split(result, ["\n"])
  end

  def solve_part1() do
    input = get_input()
    count_valid_passport(input, MapSet.new(), 0, :basic_validation)
  end

  def solve_part2() do
    input = get_input()
    count_valid_passport(input, MapSet.new(), 0, :full_validation)
  end

  def count_valid_passport([], passport_memo, count, validation_mode) do
    case validate_passport(passport_memo, validation_mode) do
      true -> count + 1
      false -> count
    end
  end

  def count_valid_passport(["" | t], passport_memo, count, validation_mode) do
    case validate_passport(passport_memo, validation_mode) do
      true -> count_valid_passport(t, %{}, count + 1, validation_mode)
      false -> count_valid_passport(t, %{}, count, validation_mode)
    end
  end

  def count_valid_passport([h | t], passport_memo = %{}, count, validation_mode) do
    # build up
    tokens = h |> String.split(" ")
    passport_memo = tokens
      |> Enum.reduce(passport_memo, fn token, acc ->
        [_, key, value] = ~r/(?<key>\w\w\w):(?<value>.*)/ |> Regex.run(token)

        acc |> Map.put(key, value)
      end)
    count_valid_passport(t, passport_memo, count, validation_mode)
  end

  def validate_passport(passport_memo, :basic_validation) do
    available_fields = MapSet.new(passport_memo |> Map.keys)
    MapSet.equal?(@required_fields, available_fields |> MapSet.delete("cid"))
  end

  def validate_passport(passport_memo, :full_validation) do
    available_fields = MapSet.new(passport_memo |> Map.keys)

    # Line 75 has "Function call without opaqueness type mismatch." warning. Why so?
    with true <- MapSet.equal?(@required_fields, available_fields |> MapSet.delete("cid")),
      true <- validate_byr(passport_memo),
      true <- validate_iyr(passport_memo),
      true <- validate_eyr(passport_memo),
      true <- validate_hgt(passport_memo),
      true <- validate_hcl(passport_memo),
      true <- validate_ecl(passport_memo),
      true <- validate_pid(passport_memo)
    do
      true
    else
      # when any of the predicates in `with` return false, return false (from the function.)
      false -> false
    end
  end

  def validate_byr(%{"byr" => value}) do
    case Regex.match?(~r/\d\d\d\d/, value) do
      true ->
        byr = String.to_integer(value)
        (byr >= 1920) && (byr <= 2002)
      false -> false
    end
  end

  def validate_iyr(%{"iyr" => value}) do
    case Regex.match?(~r/\d\d\d\d/, value) do
      true ->
        iyr = String.to_integer(value)
        (iyr >= 2010) && (iyr <= 2020)
      false -> false
    end
  end

  def validate_eyr(%{"eyr" => value}) do
    case Regex.match?(~r/\d\d\d\d/, value) do
      true ->
        eyr = String.to_integer(value)
        (eyr >= 2020) && (eyr <= 2030)
      false -> false
    end
  end

  def validate_hgt(%{"hgt" => value}) do
    case Regex.named_captures(~r/(?<height>\d+)(?<unit>cm|in)/, value) do
      %{"height" => height, "unit" => "cm"} ->
        h = String.to_integer(height)
        (h >= 150) && (h <= 193)
      %{"height" => height, "unit" => "in"} ->
        h = String.to_integer(height)
        (h >= 59) && (h <= 76)
      _ -> false
    end
  end

  def validate_hcl(%{"hcl" => value}) do
    Regex.match?(~r/#[0-9a-f]{6}/, value)
  end

  def validate_ecl(%{"ecl" => value}) do
    Regex.match?(~r/amb|blu|brn|gry|grn|hzl|oth/, value)
  end

  def validate_pid(%{"pid" => value}) do
    (String.length(value) == 9) && Regex.match?(~r/\d{9}/, value)
  end





end
