require_relative("lib/bookClass.rb")
require_relative("lib/filmClass.rb")
require_relative("lib/productCollectionClass")

main_collection = ProductCollection.from_dir("./data")

puts("Collection to_s method test: ")
puts main_collection

puts("Tests complete")