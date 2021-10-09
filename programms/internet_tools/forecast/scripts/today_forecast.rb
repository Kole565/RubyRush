require_relative "../lib/forecastgetter.rb"
require_relative "../lib/forecastprintmethod.rb"

page_body = ForecastGetter.get_page_body("https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml")
today_forecast = ForecastGetter.parse(page_body)[0]
base = today_forecast[today_forecast.keys[0]]


puts "Forecast for Onega: (today)"
print_forecast(base)

inp = STDIN.gets