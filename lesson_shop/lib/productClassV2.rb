# Parent class for any product like films, books, cookies and other.
class Product

	def initialize(price="free", stock=0)
		# Product = hash with name, type and methods
		@properties = {}
		
		if price != "free"			
			@properties["price"] = price.to_f
		end

		if stock != 0
			@properties["stock"] = stock.to_i
		end

	end
	
	def to_s
		# Abstract class
	end

	def get_property(name) # TO-DO: add custom types for names and for other stuff
		return @properties[name]
	end

	def set_property(name, value)
		@properties[name] = value
	end

end