defmodule Weathers.OpenWeathers do
  @api_key "815a0e64176add91596946e2b4831c17"
  @user_agent [{"User-agent", "PontySoft ponty@gmail.com"}]


  def fetch(params) do
     params
      |> prep_url
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  defp prep_url(arg) do
     case arg do
       %{lat: lat, lon: lon} -> "http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&APPID=#{@api_key}"
       %{city: city}     -> "http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{@api_key}"
       %{zip: zip_code}      -> "http://api.openweathermap.org/data/2.5/weather?zip=#{zip_code}&APPID=#{@api_key}"
     end
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response({ ___, %{status_code: ___, body: body}}) do
    { :error, Poison.Parser.parse!(body) }
  end

  @doc """
      This function is passed a tuple param of structure => {:ok, response}
      So we get the element @ index 1 (response) which is a map that contains
      all the weather information that we need.

      Dummy data => %{"base" => "stations", "clouds" => %{"all" => 1}, "cod" => 200,
                        "coord" => %{"lat" => 37.39, "lon" => -122.08}, "dt" => 1464419757,
                        "id" => 5375480,
                        "main" => %{"humidity" => 59, "pressure" => 1011, "temp" => 288.18,
                          "temp_max" => 292.15, "temp_min" => 283.15}, "name" => "Mountain View",
                        "sys" => %{"country" => "US", "id" => 471, "message" => 0.0496,
                          "sunrise" => 1464439824, "sunset" => 1464492085, "type" => 1},
                        "visibility" => 16093,
                        "weather" => [%{"description" => "mist", "icon" => "50n", "id" => 701,
                           "main" => "Mist"}], "wind" => %{"deg" => 320, "speed" => 2.6}}

  """
  def process_response(response) do
    %{"deg" => deg, "speed" => speed} = response["wind"]
    %{"icon" => cloud_icon, "main" => cloudiness} = Enum.at(response["weather"],0)
    %{"humidity" => humidity, "pressure" => pressure, "temp_max" => temp_max, "temp_min" => temp_min} = response["main"]
    %{"country" => country, "sunrise" => sunrise, "sunset" => sunset} = response["sys"]
      speed = speed ++ "m/s"

  end


end
