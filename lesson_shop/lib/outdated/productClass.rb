class Product

	def initialize(cost, stock)
		# Var's init
		@cost = cost.to_f
		@stock = stock.to_i
	end

	def to_s
		# Abstract class
	end

	def cost
		return @cost
	end

	def stock
		return @stock
	end

	def update(**kwargs)
		if kwargs
			
			for key, value in kwargs
				puts(value)
				set_value(key, value)
			end

		end

	end

	def set_value(value_name, value_param)
		instance_variable_set("@#{value_name.downcase}", value_param)
	end

	def self.from_file(*args)
		raise NotImplementedError
	end

end