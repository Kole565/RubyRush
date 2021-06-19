# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

require ("./gameClass.rb")
require ("./resultPrinterClass.rb")

word = ""
if (ARGV[0])
	for argument in ARGV
		case argument
		when "-n" || "--name"
			puts("Hangman: The Game")
			abort
		else
			if (word == "")
				word = argument.encode("UTF-8").chomp
			end
		end
	end
end

game = Game.new(word)
printer = ResultPrinter.new()

while (game.get_value("status") == 0)
	printer.print_status(game)
	game.ask_next_letter()
end

printer.print_status(game)