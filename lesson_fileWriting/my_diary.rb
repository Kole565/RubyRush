global_path = File.dirname(__FILE__)

require(global_path + "/data/diary_methods.rb")

puts("Приветствую пользователь! Поведай мне о чем-нибудь:")

file = File.new(global_path + "/diary_records/" + "#{Time.now.strftime("%Y-%m-%d")}.txt", "a:UTF-8")

record = []
line = ""
while (line != "end")
	line = get_value()
	record << line
end

saveRecord(record, file)
file.close

puts("Запись сохранена. Файл закрыт")