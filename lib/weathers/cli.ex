defmodule Weathers.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to the various
  functions that needs the inputs given via the command line
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` could be -h or --help, which returns :help which is a detailed info of
  what the whole app can do and inputs expected from the user end

  Otherwise it is either
  * : help
  * : Api_Key & Lat & Long
  * : Api_Key & City
  * : Api_Key & Zip code

  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean,
                                get: :boolean, lat: :float, lon: :float, city: :string, zip: :integer], aliases: [h: :help])
    case parse do
        {[help: true], _, _} -> :help
        {[get: true, lat: latitude, lon: longtitude], _, _} -> %{lat: latitude,lon: longtitude}
        {[get: true, city: the_city], _, _} -> %{city: the_city}
        {[get: true, zip: zip_code], _, _} -> %{zip_code: zip_code}
        # find pattern match for when it contains help and any other switches to return an error
        {[get: true, help: true], _, _} -> %{error: "Sorry check commands passed to terminal"}
    end

  end

  @doc """
    This function gets the returned value from parsing the command line arguments and based on the inputs either
    1 - returns a help
    2 - calls the fetch weather by lat | long function
    3 - calls the fetch weather by city function
    4 - calls the fetch weather by zip code function
    5 - retunrs a command line error message
  """
  def process(:help) do
    # use IO.ANSI instead but for now just use IO.puts
    IO.puts """
    usage1: weather --get --lat  enter latitude --lon enter longtitude
    usage2: weather --get --city enter city or city, country code
    usage3: weather --get --zip  enter zip code
    """
  end

  def process(%{lat: lat, lon: lon}) do
    IO.puts "should fetch by lat & lon: #{lat} : #{lon}"
  end

  def process(%{city: the_city}) do
    IO.puts "should fetch by city,#{the_city}"
  end

  def process(%{zip: zip_code}) do
    IO.puts "should fetch by zip code, #{zip_code}"
  end


end
