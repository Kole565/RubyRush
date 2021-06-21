class Account
	
	def initialize(standarts)
		
		for standart in standarts
			set_value(standart, nil)
		end
		
		puts("Account created")
	end

	def value_is_empty?(value_name)
		
		if (instance_variable_get("@#{value_name.downcase}") == nil)
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
		instance_variable_set("@#{value_name.downcase}", value_param)
	end

end

# Jane = Account.new("Janifer", 20)
# puts("Jane name: #{Jane.get_value("name")}, Jane age: #{Jane.get_value("age")}")
# Jane.set_value("age", 21) # Happy Birthday!
# puts("Jane name: #{Jane.get_value("name")}, Jane age: #{Jane.get_value("age")}")