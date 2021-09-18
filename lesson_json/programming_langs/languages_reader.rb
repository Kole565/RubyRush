require "json"

data = File.read("languages.json", encoding:"utf-8")
json_data = JSON.parse(data)

puts("Programming languages: ")

json_sorted = json_data.sort_by { | name, value | value }.reverse
puts("Most popular: #{json_sorted.first[0]} (#{json_sorted.first[1]})")

json_sorted.each_with_index do |value, index|
	puts("#{index + 1}. #{value[0]} (#{value[1]})")
end
