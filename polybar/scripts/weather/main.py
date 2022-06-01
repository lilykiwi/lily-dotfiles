import os
import parser
import time
import openweather

from key import get_key

def main() -> None:
    args = parser.args
    api_key = get_key()
    city = "Chichester"

    weather = openweather.get_weather(city, api_key)
    if weather:
        temp, desc = weather.values()
        if True:
            print(f"{temp}, {desc}")
        else:
            print(f"{temp}")
    else:
      # wait a bit then run main again
      time.sleep(5)
      main()


if __name__ == "__main__":
    main()
