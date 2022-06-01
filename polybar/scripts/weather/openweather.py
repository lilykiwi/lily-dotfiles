import requests

def get_weather(city: str, api_key: str) -> dict[str, str] | None:
    try:
        r = requests.get(
            f"https://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&appid={api_key}",
            headers={"User-agent": "Mozilla/5.0"},
        )
        data = r.json()
        temp = data["main"]["temp"]
        desc = data["weather"][0]["description"]
        unit = "ºC"

        return {
            "temp": f"{int(temp)}{unit}",
            "desc": desc.title(),
        }
    except Exception as e:
        #print(e)
        return None
