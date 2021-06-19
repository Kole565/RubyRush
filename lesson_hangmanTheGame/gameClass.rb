class Game

	def initialize(goal_word)
		@letters = get_letters(goal_word.downcase)
		@good_letters = []
		@bad_letters = []
		@errors = 0
		@status = 0
	end

	def get_value(value)
		return instance_variable_get("@#{value}")
	end
	
	def get_letters(goal_word)
		
		if (goal_word == nil || goal_word == "")
			abort ("Целевое слово не указано")
		else
			return goal_word.split("")
		end

	end

	def ask_next_letter()
		puts("Введите следующую букву: ")

		inp = ""
		while inp == ""
			inp = STDIN.gets.encode("UTF-8").chomp.downcase
		end

		next_step(inp)
	end

	def next_step(letter)
		
		if (@status == -1 || @status == 1)
			return

		elsif (@good_letters.include?(letter) || @bad_letters.include?(letter))
			return
		
		end

		if (@letters.include?(letter))
			@good_letters << letter

			if (@good_letters.uniq.sort == @letters.uniq.sort)
				@status = 1
			end

		else
			@bad_letters << letter
			@errors += 1

			if (@errors >= 7)
				@status = -1
			end

		end

	end

end