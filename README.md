# ex_weathers
Playing around with http://openweathermap.org/ in Elxiir as a command line tool.

In an effort to practice what have learnt so for with [Elixir](http://elixir-lang.org/), this is ex_weathers a command line tool implementing some parts of http://openweathermap.org/ web Api. 

I wish to implement most of their Api and play more with Elixir but for now, its been #COOL playing [Elixir](http://elixir-lang.org/)

### Usage

```
$ git clone https://github.com/ponty96/ex_weathers.git

$ cd ex_weathers

$ mix deps.get

$ iex -S mix

```

##### Possible commands are

* Search by Latitude and Longititude

``` 
$ Weathers.CLI.run(["--get", "--lat", "0.13", "--lon", "51.51"])
``` 


* Search by City or City and Country code

``` 
$ Weathers.CLI.run(["--get", "--city", "London"])  
``` 
``` 
$ Weathers.CLI.run(["--get", "--city", "London,uk"])  
``` 


* Search by Zip code

``` 
$ Weathers.CLI.run(["--get", "--zip_code", "112102"])
```

Unformatted successful response ->

```ex
%{
"base"    =>  "cmc stations", "clouds" => %{"all" => 64}, "cod" => 200, 
"coord"   =>  %{"lat" => 3.85, "lon" => 47.18}, "dt" => 1464658053, "id" => 62788, 
"main"    =>  %{"grnd_level" => 1023.39, "humidity" => 95, "pressure" => 1023.39, 
                 "sea_level" => 1025.33, "temp" => 298.54, "temp_max" => 298.54, "temp_min" => 298.54}, 
"name"    =>  "Ceeldheer", 
"sys"     =>  %{"country" => "SO", "message" => 0.0023, "sunrise" => 1464662350, "sunset" => 1464706735}, 
"weather" =>  [%{"description" => "broken clouds", "icon" => "04n", "id" => 803, "main" => "Clouds"}],
"wind"    =>  %{"deg" => 219.501, "speed" => 8.21}
}
```

Formatted Cmd response

![Terminal image](https://cloud.githubusercontent.com/assets/11190968/15660839/67d5009e-26d9-11e6-86db-181c93f034f3.png)


