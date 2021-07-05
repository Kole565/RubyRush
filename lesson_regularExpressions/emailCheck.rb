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

regexpr_str = "^[\w]+@[\w]+\.[\w]+$"

puts("Программа проверки email v1")
puts("Введите email:")

loop do
	inp = get_console_inp(exit_inp = "x")

	if (inp =~ /^[\w]+@[\w]+\.[\w]+$/)
		break
	else
		puts("Это не email. Повторите попытку.")
	end

end

puts("Это email. Спасибо!")