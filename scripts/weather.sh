# !/bin/bash
#
# Fetches weather from Dark Sky API for display in status bar. Requires API key
# (1000 free requests/day--about one per 90 seconds). The API key is specified
# in a `DOTSIES_WEATHER_API_KEY` environment variable that can be set in an
# `.env` file in the script directory..
#
# Source:
# 	https://github.com/jp1995/dotfiles_old/blob/2ebe13d6077ec2adb81295124f008980c6c55de8/Programs/tint2/weather-git.sh

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")
ENV_FILE="$SCRIPT_PATH/.env"

# Load environment file
if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
else
  echo "Missing API key"
	exit 1
fi

# Location (`units=us` for Fahrenheit)
location="https://api.darksky.net/forecast/${DOTSIES_WEATHER_API_KEY}/62.3908,17.3069?units=si&exclude=minutely,hourly,daily,alerts,flags"

# Get weather
weather="$(curl -s $location)"

# Get condition
[[ "$weather" =~ \"icon\":\"([^\"]*)\" ]]
condition="${BASH_REMATCH[1]}"

# Get apparent temperature (`temperature` for actual temperature)
[[ "$weather" =~ \"apparentTemperature\":([^,]*), ]]
temperature="${BASH_REMATCH[1]}"

# Print custom weather string
if grep -qi 'rain' <<< $condition; then
  printf " Shit weather"

elif grep -qi 'snow' <<< $condition; then
	printf " Shit weather"

elif grep -qi 'wind' <<< $condition; then
	printf " Shit weather"

elif grep -qi 'sleet' <<< $condition; then
	printf " Shit weather"

elif grep -qi 'cloudy' <<< $condition; then
  printf " Boring weather"

elif grep -qi 'fog' <<< $condition; then
	printf " Boring weather"

elif grep -qi 'partly-cloudy' <<< $condition; then
  printf " Decent weather"

elif grep -qi 'clear-day' <<< $condition; then
  printf " Great weather"

elif grep -qi 'clear-night' <<< $condition; then
	printf " Great weather"

else
  printf " Weird weather"
fi

# Spacing
printf " "

# Print rounded temperature
LC_ALL=C /usr/bin/printf '%.0f' " $temperature"

# Print unit character
if grep -qi 'units=us' <<< $address; then
	printf "°F"
else
	printf "°C"
fi
