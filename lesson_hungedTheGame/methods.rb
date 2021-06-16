puts("Methods loading start")

def get_user_input()
	inp = nil
	
	while (inp == nil || inp.to_i != 0)
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

def update_screen(good_letters, all_array)
	line = "_" * all_array.count

	index = 0
	for letter in all_array
		
		if (good_letters.include?(letter))
			line[index] = letter
		end

		index += 1
	end
	
	puts(line)
end

puts("Methods loaded")

update_screen(["о", "ч", "с"], ["с", "л", "о", "в", "о", "с", "о", "ч", "е", "т", "а", "н", "и", "е"])