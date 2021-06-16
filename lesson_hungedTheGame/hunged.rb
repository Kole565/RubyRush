# -*- coding: utf-8 -*-

require "./methods"

# Info
name = "Hangman: The Game"

# Variables
goal = ""
goal_array = []
good_letters = []
bad_letters = []
errors = 0

# Variables collect
if (ARGV[0])
	goal = ARGV[0].encode("UTF-8").chomp
	
	goal_array = goal.split("")
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