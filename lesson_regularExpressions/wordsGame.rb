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
require (global_path + "/wordsGameMethods.rb")

puts("Require loaded succes") # Delete this later

reg_expr = get_reg_expr()
used_words = []
count = 0

puts("Приветствую!")
puts("Введи слово по шаблону: #{reg_expr}")

loop do
	inp = get_console_inp(exit_inp = "x")

	if (inp =~ /#{reg_expr}/ && word_exist?(inp))

		if (!used_words.include?(inp.downcase))
			puts("Слово подходит")
			used_words << inp.downcase
			count += 1
		else
			puts("Это слово уже было")
		end
		
	else
		# Exit
		if (["x", "х"].include?(inp.downcase))
			break
		else
			puts("Слово не подходит!")
		end

	end

end

puts
puts("Игра завершена. Ваш счет: #{count}")