require_relative("lib/bookClassV2.rb")
require_relative("lib/foodClass.rb")
require_relative("lib/productCollectionClassV2.rb")

test_book = Book.new("Приключения барона Мюнхгаузена",  656, 100, author: "Рудольф Эрих Распе")
# puts test_book

cookies = Food.new("Chocolate cookies", "01.08.21", "120", 80, 50)
# puts cookies

# test_collection = ProductCollection.new({books: [test_book], food: [cookies]})
# test_arr = test_collection.to_a

# i = 1
# for el in test_arr
# 	puts("#{i}. #{el}")
# 	i += 1
# end

current_dir = File.dirname(__FILE__)
xml_collection = ProductCollection.from_xml(current_dir + "/data/db/products.xml")

puts("-" * 40)
puts xml_collection
puts("-" * 40)

puts("Tests complete")