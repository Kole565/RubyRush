class InputManager
	
	def initialize()
		puts("Input Manager Created")
	end

	def ask_standarts(account)
		puts("Ask Standarts")

		if (account.get_value("standarts"))
			
			for standart in account.get_value("standarts")
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
		while (!(pos_answ + neg_answ).include?(inp))
			inp = STDIN.gets.encode("UTF-8").chomp.downcase
		end

		if (pos_answ.include?(inp))
			return true
		else
			return false
		end
		
	end

	def float_question()
		
		inp = ""
		while (inp == "" || inp == nil)
			inp = STDIN.gets.encode("UTF-8").chomp
		end

		return inp
		
	end

end