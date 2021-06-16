# -*- coding: utf-8 -*-

require "./methods"

# Info
name = "Hangman: The Game"
description = "Hangman is a paper and pencil guessing game for two or more players. " \
				"One player thinks of a word, phrase or sentence and the other(s) tries to guess it" \
				" by suggesting letters within a certain number of guesses."

# Variables
goal = ""
goal_array = []
good_letters = []
bad_letters = []
errors = 0

# Variables collect
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
puts("Game start")

while (errors < 7)
	puts("You'r letter: ")
	
	choice = get_user_input()
	choice_check = check_letter(goal_array, good_letters, bad_letters, choice)
	puts("choice check: #{choice_check}")
	if (choice_check == 1)
		puts("choice check")
		
		good_letters << choice
		update_screen(good_letters, goal_array, errors)
	
	elsif (choice_check == 0)
		# We just mercy if player choice same letter

	else
		bad_letters << choice
		update_screen(good_letters, goal_array, errors)
		errors += 1
	end

end

puts("Game end")