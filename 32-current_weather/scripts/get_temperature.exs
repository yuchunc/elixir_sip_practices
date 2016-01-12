[woeid | _rest] = System.argv

temp = CurrentWeather.YahooFetcher.fetch(woeid)
IO.puts "The current weather for WOEID #{woeid} is #{temp} degrees fahrenheit."

# Invoke by
# mix run scripts/get_temperature.exs <woeid>
