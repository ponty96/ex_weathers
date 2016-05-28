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


end
