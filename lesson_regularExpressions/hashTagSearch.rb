# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

global_path = File.dirname(__FILE__)

require (global_path + "/../utils/methods.rb")

puts("Программа для нахождения хэштэгов в строке")
puts
puts("Введите строку с хэштегами: ")

inp = get_console_inp(exit_inp = "x")
tags = inp.scan(/#[^ .!?]+/)

if (tags)
	puts("Нашли вот такие хэштеги: ")
	for tag in tags
		puts(tag)
	end
else
	puts("Хэштэгов не обнаружено")
end