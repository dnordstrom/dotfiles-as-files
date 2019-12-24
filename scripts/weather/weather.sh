#!/usr/bin/env bash
#
# Fetches weather from Dark Sky API for display in status bar. Requires API key
# (1000 free requests/day--about one per 90 seconds). The API key is specified
# in a `DOTSIES_WEATHER_API_KEY` environment variable that can be set in an
# `.env` file in the script directory..
#
# Source:
# 	https://github.com/jp1995/dotfiles_old/blob/2ebe13d6077ec2adb81295124f008980c6c55de8/Programs/tint2/weather-git.sh

set -eu

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"
ENV_FILE="$SCRIPT_PATH/.env"

# Load environment file
if [[ -f "$ENV_FILE" ]]; then
  source "$ENV_FILE"
else
  echo "Missing API key"
	exit 1
fi

# Location (`units=us` for Fahrenheit)
LOCATION="https://api.darksky.net/forecast/${DOTSIES_WEATHER_API_KEY}/62.3908,17.3069?units=si&exclude=minutely,hourly,daily,alerts,flags"

# Get weather
WEATHER="$(curl -s "$LOCATION")"

# Get condition
[[ "$WEATHER" =~ \"icon\":\"([^\"]*)\" ]]
CONDITION="${BASH_REMATCH[1]}"

# Get apparent temperature (`temperature` for actual temperature)
[[ "$WEATHER" =~ \"apparentTemperature\":([^,]*), ]]
TEMPERATURE="${BASH_REMATCH[1]}"

# Print custom weather string
if grep -qi "rain" <<< "$CONDITION"; then
  printf " Shit weather"

elif grep -qi "snow" <<< "$CONDITION"; then
	printf " Shit weather"

elif grep -qi "wind" <<< "$CONDITION"; then
	printf " Shit weather"

elif grep -qi "sleet" <<< "$CONDITION"; then
	printf " Shit weather"

elif grep -qi "cloudy" <<< "$CONDITION"; then
  printf " Boring weather"

elif grep -qi "fog" <<< "$CONDITION"; then
	printf " Boring weather"

elif grep -qi "partly-cloudy" <<< "$CONDITION"; then
  printf " Decent weather"

elif grep -qi "clear-day" <<< "$CONDITION"; then
  printf " Great weather"

elif grep -qi "clear-night" <<< "$CONDITION"; then
	printf " Great weather"

else
  printf " Weird weather"
fi

# Spacing
printf " "

# Print rounded temperature
LC_ALL=C /usr/bin/printf '%.0f' " $TEMPERATURE"

# Print unit character
if grep -qi 'units=us' <<< "$LOCATION"; then
	printf "°F"
else
	printf "°C"
fi
