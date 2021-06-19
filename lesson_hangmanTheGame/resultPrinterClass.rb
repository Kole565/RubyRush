class ResultPrinter

	def print_status(game)
		puts(get_picture(game.get_value("errors")))
		puts("Слово: #{get_word_for_print(game.get_value("letters"), game.get_value("good_letters"))}")
		puts("Ошибки: #{game.get_value("bad_letters").join(", ").to_s}")

		if (game.get_value("status") == -1)
			puts("\nВы проиграли") # Note: use game manager methods here later
			puts("Загаданное слово было: " + game.get_value("letters").join(""))
			
		elsif(game.get_value("status") == 1)
			puts("Вы выиграли!") # Note: use game manager methods here later
		else
			puts("У вас осталось попыток: #{(7 - game.get_value("errors")).to_s}")
		end

	end

	def cls()
		system("clear") || system("cls")
	end

	def get_word_for_print(letters, good_letters)
		word = ""

		for letter in letters
			
			if (good_letters.include?(letter))
				word += letter
			else
				word += "_"
			end

		end

		return word
	end

	def get_picture(file_num)
		file = File.new("./image/#{file_num}.txt", "r:UTF-8")
		picture = file.read

		return picture
	end

end