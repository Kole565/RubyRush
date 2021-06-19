class Account

	def initialize(name = nil, age = nil)
		@name = name
		@age = age
		
		puts("Account created")
	end

	def value_is_empty?(value_name)
		
		if (instance_variable_get("@#{value_name}") == nil)
			return true
		else
			return false
		end
		
	end

	def get_value(value_name)

		if (value_is_empty?(value_name))
			return
		else
			return instance_variable_get("@#{value_name}")
		end

	end

	def set_value(value_name, value_param)
		
	end

end