require "date"
require_relative "productClassV2.rb"

class Food < Product
	
	def initialize(name, production_date, validity, price=nil, stock=nil, **kwargs)
		# Call parent to create properties hash
		super(price, stock)
		
		# Set own properties
		@properties["name"] = name

		# Time parsing
		@properties["production_date"] = Date.strptime(production_date, "%d.%m.%y") # 01.01.10
		@properties["validity"] = "#{validity} d."
		@properties["expiration_date"] = Date.strptime(production_date, "%d.%m.%y") + validity.to_i

		# Set as many properties as needed
		if kwargs
			for field_name, value in kwargs
				@properties[field_name] = value
			end
		end

	end

	def to_s
		info = "Food: "
		info += "<<#{get_property("name")}>> "

		optional_properties = @properties.keys - ["name", "price", "stock", "production_date", "validity", "expiration_date"]
		if !optional_properties.empty?
			info += "\n"
			for property in optional_properties # Optional = not name, price and stock (- date too)
				info += "#{property.capitalize}: #{get_property(property)}"
			end
			info += "\n"
		end

		info += "#{get_property("price")} rub. "
		info += "[stock: #{get_property("stock")}]\n"

		info += "Production date: #{get_property("production_date")} Validity: #{get_property("validity")} Expires: #{get_property("expiration_date")}"

		return info
	end

end