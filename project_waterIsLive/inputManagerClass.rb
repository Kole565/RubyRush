class InputManager
	
	def initialize()
		puts("Input Manager Created")
	end

	def ask_standarts(account, standarts)
		puts("Ask Standarts")

		if (standarts)
			
			for standart in standarts
				account.set_value(standart, ask_value(account, standart))
			end

		end

		puts("Standarts Created")
	end

	def ask_value(account, value_name)
		puts("#{value_name.capitalize}: ")

		inp = ""
		while (inp == "" || inp == nil)
			inp = STDIN.gets.encode("UTF-8").chomp.downcase
		end

		return inp
	end

	def pos_neg_question()
		pos_answ = ["y", "yes", "д", "да"]
		neg_answ = ["n", "no", "н", "нет"]
		
		inp = ""
		while ((pos_answ + neg_answ).include?(inp))
			inp = STDIN.gets.encode("UTF-8").chomp.downcase
		end

		if (pos_answ.include?(inp))
			return true
		else
			return false
		end
		
	end

end

# standarts = ["name", "gender", "age"]
# vasya = Account.new(standarts)
# puts(vasya.get_value("name"))
# IManager = InputManager.new()
# IManager.ask_standarts(vasya, standarts)
# puts()
# puts("Vasya name: #{vasya.get_value("name")}")
# puts("Vasya gender: #{vasya.get_value("gender")}")
# puts("Vasya age: #{vasya.get_value("age")}")