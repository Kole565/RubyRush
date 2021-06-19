class Account

	def initialize(name = nil)
		@name = name
		
		puts("Account created")
	end

	def value_is_empty?(value)
		
		if (instance_variable_get("@#{value}") == nil)
			return true
		else
			return false
		end
		
	end

end