class InputManager

	def ask_standarts(account, standarts)
		puts("Ask Standarts")

		if (standarts)
			
			for standart in standarts
				if (get_value(account, standart))
			end

		end

	end

	def ask_value(account, value)
		
		if (account.value_is_empty?(value))
			puts("Ask want to set value")
			
			return

		else
			puts("Ask want to change value")
			
			inp = ""
			while (!["y", "n", "д", "н", "yes" "no", "да", "нет"].include?(inp))
				
				if (["y", "yes", "д", "да"])
					inp = STDIN.gets.encode("UTF-8").chomp.downcase
					return inp
				else
					return
				end

			end

		end

	end

end