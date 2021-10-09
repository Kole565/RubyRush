require_relative "productClassV2.rb"

class Book < Product
	
	def initialize(name, price=nil, stock=nil, **kwargs)
		# Call parent for 'properties'
		super(price, stock)
		
		# Set own properties
		@properties["name"] = name

		# Set as many properties as needed
		if kwargs
			for field_name, value in kwargs
				@properties[field_name] = value
			end
		end

	end

	def to_s
		info = "Book: "
		info += "<<#{get_property("name")}>> "

		optional_properties = @properties.keys - ["name", "price", "stock"]
		if !optional_properties.empty?
			info += "\n"
			for property in optional_properties # Optional = not name, price and stock
				info += "#{property.capitalize}: #{get_property(property)}\n"
			end
		end

		info += "#{get_property("price")} rub. "
		info += "[stock: #{get_property("stock")}]"

		return info
	end

end