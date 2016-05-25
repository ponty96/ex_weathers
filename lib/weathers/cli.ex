defmodule Weathers.CLI do
  @accuracy_level 2

  @moduledoc """
  Handle the command line parsing and the dispatch to the various
  functions that needs the inputs given via the command line
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` could be -h or --help, which returns :help which is a detailed info of
  what the whole app can do and inputs expected from the user

  Otherwise it is either
  * : Api_Key
  * : Lat & Long
  * : Location = %{ Country, State, Postal Code }
  * : Duration = %{ start_date, end_date }

  """
  def parse_args(argv) do

  end
end
