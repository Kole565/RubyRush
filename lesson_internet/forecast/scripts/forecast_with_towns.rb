require_relative "../../../utils/winEncodeFix.rb"
require_relative "../../../utils/methods.rb"

require_relative "../lib/weather_report.rb"
require_relative "../lib/towns"


puts "What's a town?"
get_towns.each_with_index do | town_name, index |
	puts("#{index + 1}. #{town_name[0]}")
end

town_ind = get_console_inp().to_i - 1

weather_reports = []

puts "Loading. Please wait"
for x in 0..3
	weather_reports << get_weather_report_by_town(get_towns.keys[town_ind], x)
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