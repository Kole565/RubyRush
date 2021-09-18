require_relative "../utils/methods.rb"
require_relative "./lib/interface_methods.rb"

product_collection = ProductCollection.from_xml("E:/Documents_Large/NeedMoreCode/RubyRush/lesson_shop/data/db/products.xml")

functions = {}
functions[0] = ["Show all products", lambda { show_products(product_collection) }]
functions[1] = ["Buy product", lambda { buy_product (product_collection)}]
functions[2] = ["Reset shop", lambda { reset_shop (product_collection)}]
functions[3] = ["Save shop", lambda { save_shop (product_collection)}]
functions[4] = ["Add product", lambda { add_product (product_collection)}]


puts("Welcome to 'Shop'!")

shop_active = true

puts("That what you can do (type 'exit' to quit): ")
for index, container in functions
	puts("#{index + 1}. #{container[0]}")
end


# puts("1. Show all products")
# puts("2. Buy product")
# puts("3. Reset shop")
# puts("4. Save shop")

while functions_choice(functions)
	for index, container in functions
		puts("#{index + 1}. #{container[0]}")
	end
end

puts("Build succes")