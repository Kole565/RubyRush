# -*- coding: utf-8 -*-

def get_user_input()
	inp = ""

	while (inp == "")
		inp = STDIN.gets.encode("UTF-8").chomp
		inp.downcase!

		if (inp == "ё")
			inp = "е"
		end
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

def update_screen(visible_letters, word_array, errors)
	picture = get_picture(errors)
	line = "\t " + create_line(visible_letters, word_array)

	if (Gem.win_platform?)
		system("cls")
	end

	puts(picture)
	puts(line)
end

def create_line(visible_letters, word_array)
	res = "_" * word_array.count

	index = 0
	for letter in word_array
		
		if (visible_letters.include?(letter))
			res[index] = letter
		end

		index += 1
	end
	
	return res
end

def get_picture (file_num)
	file = File.new("./image/#{file_num}.txt", "r:UTF-8")
	picture = file.read

	return picture
end