# -*- coding: utf-8 -*-

require "./methods"

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

# Variables
goal = nil
goal_array = []
good_letters = []
bad_letters = []
errors = 0

# Console arguments scan
if (ARGV[0])
	
	for argument in ARGV
		case argument
		when "-n", "--name"
			puts(name)
		when "-desc", "--description"
			puts(description)
		else
			
			if (!goal)
				goal = argument.encode("UTF-8").chomp
				goal_array = goal.split("")
			end
		end
	end
end

# Game
puts
puts(name)
puts(get_picture(0))

while (errors < 7)
	puts("You'r letter: ")
	
	choice = get_user_input()
	choice_check = check_letter(goal_array, good_letters, bad_letters, choice)
	
	if (choice_check == 1)
		
		good_letters << choice
		update_screen(good_letters, goal_array, errors)
	
	elsif (choice_check == 0)
		# We just mercy if player choice same letter

	else
		bad_letters << choice
		errors += 1
		update_screen(good_letters, goal_array, errors)
	end

	if (good_letters.count == goal_array.uniq.count)
		puts("You win!")
		break
	end
end