# ex_weathers
Playing around with http://openweathermap.org/ in Elxiir as a command line tool

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
