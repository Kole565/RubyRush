require ("./gameClass.rb")
require ("./resultPrinterClass.rb")

# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

# Info
name = "Hangman: The Game"
description = "Hangman is a paper and pencil guessing game for two or more players. " \
				"One player thinks of a word, phrase or sentence and the other(s) tries to guess it" \
				" by suggesting letters within a certain number of guesses."

word = ""
if (ARGV[0])
	for argument in ARGV
		case argument
		when "-n", "--name"
			puts(name)
		when "-desc", "--description"
			puts(description)
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
	printer.cls()
end

printer.print_status(game)