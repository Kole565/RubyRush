# This file use file from gems lesson (sendMail) folder and catch there exceptions

# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

global_path = File.dirname(__FILE__)

require (global_path + "/../lesson_gemsPonyMail/sendMail.rb")

begin
	data = get_user_values()
	
	send_mail(data[0], data[1], data[2], data[3], data[4])
rescue => exception
	# Catch any error and show it
	puts("Возникла ошибка: ")
	puts(exception.message)
else
	puts("Письмо отправлено успешно: ")

	puts("Письмо из: #{data[0]}")
	puts("Тема письма: #{data[2]}")
	puts("Текст письма: #{data[3]}")
	puts("Получатель: #{data[4]}")
end