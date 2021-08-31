# Version 2
global_path = File.dirname(__FILE__)
holiday_list_file_path = "/data/holidays.txt"

if (File.exist?(global_path + holiday_list_file_path))
	holiday_list_file = File.open(global_path + holiday_list_file_path, "r:UTF-8")
	holiday_list = []
	
	lines = holiday_list_file.readlines
	for line in lines
		holiday_list << line.chomp
	end
end

t = Time.now
# date = t.strftime("%m.%d")
# week_day = t.strftime("%u")

puts("Date: #{date}")
puts("Week day: #{week_day}")

now_holiday = false
if (week_day == "6" || week_day == "7")
	now_holiday = true
end

if (holiday_list)
	
	if (holiday_list.include?(date))
		now_holiday = true
	end

else
	puts("Файл с праздниками отсутствует или не отсортирован. Использован алгоритм на основе дней недели.")
end

if (now_holiday)
	puts("Каникулы!")
else
	puts("Работа!")
end