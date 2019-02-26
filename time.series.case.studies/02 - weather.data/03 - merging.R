# Confirm the periodicity and duration of the vis and wind data
periodicity(vis)
periodicity(wind)

# Merge vis and wind with your existing flights_temps data
flights_weather <- merge(flights_temps, vis, wind)

# View the first few rows of your flights_weather data
head(flights_weather)

