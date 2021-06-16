puts("Methods loading start")

def get_user_input()
	inp = ""
	
	while (inp == "")
		inp = STDIN.gets.encode("UTF-8").chomp
	end

	return inp
end

def check_letter(goal_array, good_letters, bad_letters, choice)
	res = nil

	if (goal_array.include?(choice))

		if ((good_letters + bad_letters).include?(choice))
			res = 0
		else
			res = 1
		end

	else 
		
		if ((good_letters + bad_letters).include?(choice))
			res = 0
		else
			res = -1
		end

	end

	return res
end

puts("Methods loaded")