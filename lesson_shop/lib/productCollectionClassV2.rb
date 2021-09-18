require "rexml/document"
require_relative "bookClassV2.rb"
require_relative "filmClassV2.rb"
require_relative "foodClass.rb"

# Class ProductCollection
# Contain products list (hash with coop by type), implement sorting, viewing
# Storage hash format be like: {books: [first_book, second_book], food: [cookies, bread]}

class ProductCollection
	
	def initialize(products_to_save, path_to_xml="")
		@storage = products_to_save # <== Hash
		if path_to_xml != ""
			@path_to_xml = path_to_xml
		end
	end

	def storage
		return @storage
	end

	def set_storage(value)
		@storage = value
	end

	def get_xml_path()
		return @path_to_xml
	end

	def self.from_xml(path_to_xml)
		# Get one xml db file and write it to @storage
		file = File.new(path_to_xml)
		doc = REXML::Document.new(file)
		file.close
		
		@path_to_xml = path_to_xml
		

		storage = {}
		for item in doc.root.elements
			# If item name in storage => add item to storage
			# Else => add new category
			if !storage.keys.include?(item.name)
				storage[item.name] = []
			end
			
			fields = {}
			for field in item.elements
				
				if field.attributes.include?("hidden")
					if field.attributes["hidden"] == "true"
						# If attr hidden don't show him

					else
						fields[field.name] = field.text.strip
					end
				else
					fields[field.name] = field.text.strip
				end	
				
			end
			
			case item.name
			when "book"
				item_to_save = Book.new(fields["name"], fields["price"], fields["stock"])
				
				optional_properties = fields.keys - ["name", "price", "stock"]
				if !optional_properties.empty?

					for optional_property in optional_properties
						item_to_save.set_property(optional_property, fields[optional_property])
					end

				end

				storage["book"] << item_to_save

			when "food"
				item_to_save = Food.new(fields["name"], fields["production_date"], fields["validity"], fields["price"], fields["stock"])

				optional_properties = fields.keys - ["name", "production_date", "validity", "price", "stock"]
				if !optional_properties.empty?

					for optional_property in optional_properties
						item_to_save.set_property(optional_property, fields[optional_property])
					end

				end

				storage["food"] << item_to_save

			when "film"
				item_to_save = Film.new(fields["name"], fields["price"], fields["stock"])
				
				optional_properties = fields.keys - ["name", "price", "stock"]
				if !optional_properties.empty?

					for optional_property in optional_properties
						item_to_save.set_property(optional_property, fields[optional_property])
					end

				end

				storage["film"] << item_to_save

			else
				puts("Not supported item type")
			end
		end

		self.new(storage, path_to_xml)

	end

	def to_a
		# Return all products in storage array
		all_items = []

		for category in @storage.keys
			
			for item in @storage[category]
				all_items << item
			end

		end
		
		return all_items
	end

	def to_s
		output = ""

		index = 1
		for item in self.to_a
			output += "#{index}. #{item.to_s}\n\n"
			index += 1
		end

		return output
	end

	def buy_item(index)
		status = []
		
		status_text = ""
		item_price = 0
		
		if self.to_a.count >= index + 1 && index + 1 > 0
			# If product exist
			item = self.to_a[index]
			
			# Check amount
			if item.get_property("stock").to_i > 0
				item.set_property("stock", item.get_property("stock").to_i - 1)

				status_text += "Item #{item.get_property("name")} buyed. "
				status_text += "Stock: #{item.get_property("stock")}."
				item_price = item.get_property("price")
			else
				status_text += "Sorry, the item is out of stock"
			end

		else
			status_text = "Product with index #{index + 1} don't exist"
		end

		status[0] = status_text
		status[1] = item_price

		return status
		
		# TO-DO: Sum and other money do's
	end

	def reload()
		puts("Reset don't set")
	end

	def save()
		puts("Save don't set")
	end

end