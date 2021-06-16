require "./methods"

# Info

# Variables
goal = ""
goal_array = []
good_letters = []
bad_letters = []
errors = 0
attempts = 7

# Variables collect

# Game
puts("Game start")

while (errors < attempts)
	puts("Ask letter")
	
	choice = get_user_input()

	check_letter(goal_array, good_letters, bad_letters, choice, errors)

end

pust("Game end")