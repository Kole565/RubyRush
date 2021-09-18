require "json"
require "date"

require_relative "../../utils/methods.rb"

data = File.read("data/seasons.json", encoding:"utf-8")
json_data = JSON.parse(data)

puts "What's your birthday?"
date_inp = get_console_inp()

birth_date = Date.parse(date_inp + ".2000")

user_season = nil
user_season_weather = nil

json_data.each do |season_name, value|

	if birth_date >= Date.parse(value["date"].split(" ")[0] + ".2000") &&
		birth_date <= Date.parse(value["date"].split(" ")[1] + ".2000")
		
		user_season = season_name
		user_season_weather = value["weather"]	
	end
	
end


puts "Your season is: #{user_season}"
puts "Common weather: #{user_season_weather}"