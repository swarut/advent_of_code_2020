defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "validate_byr" do
    assert Day4.validate_byr(%{"byr" => "1920"}) == true
    assert Day4.validate_byr(%{"byr" => "2002"}) == true
    assert Day4.validate_byr(%{"byr" => "1919"}) == false
    assert Day4.validate_byr(%{"byr" => "2003"}) == false
  end

  test "validate_iyr" do
    assert Day4.validate_iyr(%{"iyr" => "2010"}) == true
    assert Day4.validate_iyr(%{"iyr" => "2020"}) == true
    assert Day4.validate_iyr(%{"iyr" => "2009"}) == false
    assert Day4.validate_iyr(%{"iyr" => "2021"}) == false
  end

  test "validate_eyr" do
    assert Day4.validate_eyr(%{"eyr" => "2020"}) == true
    assert Day4.validate_eyr(%{"eyr" => "2030"}) == true
    assert Day4.validate_eyr(%{"eyr" => "2019"}) == false
    assert Day4.validate_eyr(%{"eyr" => "2031"}) == false
  end

  test "validate_hgt" do
    assert Day4.validate_hgt(%{"hgt" => "150cm"}) == true
    assert Day4.validate_hgt(%{"hgt" => "193cm"}) == true
    assert Day4.validate_hgt(%{"hgt" => "149cm"}) == false
    assert Day4.validate_hgt(%{"hgt" => "194cm"}) == false

    assert Day4.validate_hgt(%{"hgt" => "59in"}) == true
    assert Day4.validate_hgt(%{"hgt" => "76in"}) == true
    assert Day4.validate_hgt(%{"hgt" => "58in"}) == false
    assert Day4.validate_hgt(%{"hgt" => "77in"}) == false
  end

  test "validate_hcl" do
    assert Day4.validate_hcl(%{"hcl" => "#000000"}) == true
    assert Day4.validate_hcl(%{"hcl" => "#999999"}) == true
    assert Day4.validate_hcl(%{"hcl" => "#aaaaaa"}) == true
    assert Day4.validate_hcl(%{"hcl" => "#ffffff"}) == true
    assert Day4.validate_hcl(%{"hcl" => ""}) == false
    assert Day4.validate_hcl(%{"hcl" => "000"}) == false
    assert Day4.validate_hcl(%{"hcl" => "#000"}) == false
    assert Day4.validate_hcl(%{"hcl" => "#AAA"}) == false
    assert Day4.validate_hcl(%{"hcl" => "#zzz000"}) == false
    assert Day4.validate_hcl(%{"hcl" => "#111abz"}) == false
  end

  test "validate_ecl" do
    assert Day4.validate_ecl(%{"ecl" => "amb"}) == true
    assert Day4.validate_ecl(%{"ecl" => "blu"}) == true
    assert Day4.validate_ecl(%{"ecl" => "brn"}) == true
    assert Day4.validate_ecl(%{"ecl" => "gry"}) == true
    assert Day4.validate_ecl(%{"ecl" => "grn"}) == true
    assert Day4.validate_ecl(%{"ecl" => "hzl"}) == true
    assert Day4.validate_ecl(%{"ecl" => "oth"}) == true
    assert Day4.validate_ecl(%{"ecl" => "abc"}) == false
  end

  test "validate_pid" do
    assert Day4.validate_pid(%{"pid" => "111111111"}) == true
    assert Day4.validate_pid(%{"pid" => "1111111111"}) == false
    assert Day4.validate_pid(%{"pid" => "1"}) == false
  end
end
