defmodule CliTest do
  use ExUnit.Case
  doctest Weathers

  import Weathers.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "map of lat and longitude returned with --get --lat value & --lon value as options" do
    assert parse_args(["--get", "--lat", "30.58", "--lon", "50.8"]) == %{lat: 30.58,lon: 50.8}
  end

  test "map of city returned with --get --city name, or city id as options" do
    assert parse_args(["--get", "--city", "London, uk"]) == %{city: "London, uk"}
  end

  test "map of zipcode returned with --get --zip name, or city id as options" do
    assert parse_args(["--get", "--zip", "30000"]) == %{zip_code: 30000}
  end

end
