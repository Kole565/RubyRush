# -*- coding: utf-8 -*-

puts("Methods loading start")

def get_user_input()
	inp = ""

	while (inp == "")
		inp = STDIN.gets.encode("UTF-8").chomp # Output:
		puts("In get user inp cycle: " + inp)  # In get user inp cycle: ?
	end
	puts("In get user inp: " + inp)            # In get user inp: ?
	return inp
end

def check_letter(goal_array, good_letters, bad_letters, choice)
	res = nil
	puts("Goal array: #{goal_array.to_s}, Choice: #{choice}, Statement: #{goal_array.include?(choice)}")
	if (goal_array.include?(choice))
		puts("Good letters: #{good_letters}, bad letters: #{bad_letters}, choice: #{choice}")
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
		# system("cls")
	end

	puts(picture)
	puts(line)
end

def create_line(visible_letters, word_array)
	res = "_" * word_array.count
	puts(visible_letters.to_s, word_array.to_s)
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

puts("Methods loaded")

# update_screen(["о"], ["о", "л", "о", "в", "о"], 3)