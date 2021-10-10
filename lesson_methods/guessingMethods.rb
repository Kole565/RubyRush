# Info
name = "Guessing"
version = "0.2"
author = "Kole565"
description = "It's a game where you should guess random number " \
"from 3 attempts"

# Set up
goal = rand(16)
attempts = 3
current_attempt = 0

# Conslole arguments control
if (ARGV[0])
	
	for argument in ARGV
		argument = argument.encode("UTF-8").chomp
		
		if (argument == "-n" || argument == "-name")
			puts(name)

		elsif (argument == "-v" || argument == "-version")
			puts("v#{version}")
			
		elsif (argument == "-author")
			puts(author)

		elsif (argument == "-desc" || argument == "-description")
			puts(description)
		
		elsif (argument == "import_this")
			puts("It's not a Python!")

		end
	end
	abort
end

# Main method
def win_check(current_try, goal, choice)
	res = [] # [0] - isWin, [1] - bias

	if (current_try <= attempts)
		
		if (choice == goal)
			res[0] = true
		
		elsif (choice >= goal - 2 && choice <= goal + 2)
			res[1] = "Горячо "

		else
			res[1] = "Холодно "

		end

		if (choice < goal && !res[0])
			res[1] += "(нужно больше)"
		
		elsif (goal && !res[0])
			res[1] += "(нужно меньше)"

		end
	else
		res[0] = false
		res[1] = ""
	end

	return res
end

# User's interaction
puts("Загадано число от 0 до 16, отгадайте какое? У вас 3 попытки.")

# Main logic
while (true)
	if (current_attempt <= attempts)
		
		# Collect choice
		while (true)
			user_input = STDIN.gets.encode("UTF-8").chomp

			if (user_input != nil && user_input.to_i.is_a?(Numeric))
				choice = user_input.to_i
				break
			end
		end
		
		res = win_check(current_attempt, goal, choice)
		
		if (res[0])
			puts("Ура, вы выиграли!")
		else
			current_attempt += 1
		end

	else
		puts()
	end
end