require_relative "./productCollectionClassV2.rb"

def show_products(product_collection)
	puts product_collection
end

def buy_product(product_collection)
	puts("What product index?")

	inp = ""
	sum = 0
	while true
		inp = get_console_inp(exit_inp="exit")
		
		if inp == "exit"
			puts("Thanks for shoping!")
			puts("From you: #{sum} rub.")
			break
		end

		state = product_collection.buy_item(inp.to_i - 1) # State is a array with 
		puts(state[0])                                    # method buy_item output
		sum += state[1]

	end

end

def get_xml_doc(path)
	file = File.new(path, "r:UTF-8")
	doc = REXML::Document.new(file)
	file.close

	return doc
end

def save_to_xml(path, doc)
	file = File.new(path, "w:UTF-8")
	doc.write(file, 2)
	file.close
end

def add_field(field_name, field_value="", tag)
	field = tag.add_element field_name
	if field_value != ""
		field.text = field_value
	end

	return field
end

def add_product(product_collection)
	doc = get_xml_doc(product_collection.get_xml_path())
	
	products_container = doc.elements.first # 'products' tag 

	product_types_list = [
		"book",
		"film",
		"food",		
	]
	
	puts("What's product you want to add?")
	product_types_list.each_with_index do |product_type, index|
		puts("#{index + 1}. #{product_type.capitalize}")
	end

	inp = ""
	while true
		inp = get_console_inp(exit_inp="exit")

		product_type_ind = inp.to_i - 1

		if product_type_ind.to_i > -1 && product_type_ind.to_i <= product_types_list.size
			product_type = product_types_list[product_type_ind]
			break
		end

	end

	item = add_field(product_types_list[product_type_ind], tag=products_container)

	properties = {}
	puts("Now set-up args. Type 'done' when all.")
	puts("Neccesary args: name for items, production_date and validity for food")
	
	while true
		puts("Give attribute name: ")
		attribute_name = get_console_inp(exit_inp="done")

		if attribute_name == "done"
			break
		end

		puts("Give attribute value: ")
		attribute_value = get_console_inp(exit_inp="done")

		if attribute_value == "done"
			break
		end

		add_field(attribute_name, attribute_value, item)
	end

	save_to_xml(product_collection.get_xml_path(), doc)

end

def reset_shop(product_collection)
	product_collection.reload()
end

def save_shop(product_collection)
	product_collection.save()
end

def functions_choice(functions)
	
	inp = get_console_inp(exit_inp="exit")
	if functions.keys.include?(inp.to_i - 1) # <== Correct input
		functions[inp.to_i - 1][1].call()
		return true
	elsif inp == "exit"
		puts("Goodbye!")
	else
		puts("Input does't correct")
	end

end