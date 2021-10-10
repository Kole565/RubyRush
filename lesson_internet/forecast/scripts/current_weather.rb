require_relative "../../../utils/winEncodeFix.rb"
require_relative "../lib/weather_report.rb"

weather_report = get_weather_report("https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml")

for field_name, field_value in weather_report
	
	if field_name["_"]
		field_name = field_name.to_s.split("_").join(" ")
	end

	puts "#{field_name.capitalize} => #{field_value}"
end