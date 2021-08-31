require ("./gameClass.rb")
require ("./resultPrinterClass.rb")
require ("./fileReaderClass.rb")

global_path = File.dirname(__FILE__)

# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

# Methods (move to single file later)
def args_check(args, word)
	for argument in args
		case argument
		when "-n", "--name"
			puts(name)
		when "-desc", "--description"
			puts(description)
		else
			if (word == "")
				word = argument.encode("UTF-8").chomp
				return word
			else
				return
			end
		end
	end
end

# Info
name = "Hangman: The Game"
description = "Hangman is a paper and pencil guessing game for two or more players. " \
				"One player thinks of a word, phrase or sentence and the other(s) tries to guess it" \
				" by suggesting letters within a certain number of guesses."

word = ""

begin
	if (ARGV[0])
		word = args_check(ARGV, word)
	else
		begin
		# If args don't contain goal word use word from file
			file_reader = FileReader.new()
			word = file_reader.read_from_file(global_path, "/data/wordsList.txt")
		rescue => exception
			puts("File reader error")
			puts(exception)
		end
	end
rescue => exception
	puts("You catch a error in console checking or files reading: ")
	puts(exception)
end

game = Game.new(word)
printer = ResultPrinter.new(global_path)

while (game.get_value("status") == 0)
	
	printer.print_status(game)
	
	game.ask_next_letter()
	printer.cls()
end

printer.print_status(game)