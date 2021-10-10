class ResultPrinter

	def initialize(path)
		@global_path = path
	end

	def print_status(game, testing_now = false)
		
		if !testing_now
			begin
				puts(get_picture("/data/images/#{game.get_value("errors")}.txt"))
			rescue Errno::ENOENT => exception
				puts("Image file not found")
			end

			puts("Слово: #{get_word_for_print(game.get_value("letters"), game.get_value("good_letters"))}")
			puts("Ошибки: #{game.get_value("bad_letters").join(", ").to_s}")

		end

		if (game.get_value("status") == -1)
			puts("\nВы проиграли") # Note: use game manager methods here later
			puts("Загаданное слово было: " + game.get_value("letters").join(""))

			if testing_now
				return "You lose!"
			end
			
		elsif(game.get_value("status") == 1)
			puts("You win!") # Note: use game manager methods here later

			if testing_now
				return "You win!"
			end
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

	def get_picture(file_path)
		path = @global_path + file_path

		file = File.new(path, "r:UTF-8")
		picture = file.read

		file.close

		return picture
	end

end