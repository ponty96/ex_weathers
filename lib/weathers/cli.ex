defmodule Weathers.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to the various
  functions that needs the inputs given via the command line
  """

  def run(argv) do
    parse_args(argv)
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
    end

  end


end
