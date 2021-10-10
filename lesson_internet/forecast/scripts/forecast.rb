require_relative "../../../utils/winEncodeFix.rb"

require_relative "../lib/weather_report.rb"

weather_reports = []

puts "Loading. Please wait"
for x in 0..3
	weather_reports << get_weather_report("https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml", x)
	print "#{x * 100 / 4}% completed\r"
end
puts

for report in weather_reports

	for field_name, field_value in report
		
		if field_name["_"]
			field_name = field_name.to_s.split("_").join(" ")
		end

		puts "#{field_name.capitalize} => #{field_value}"

	end
	
	puts

end