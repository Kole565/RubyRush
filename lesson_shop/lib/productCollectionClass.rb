require_relative("bookClass.rb")
require_relative("filmClass.rb")

# Class ProductCollection
# contain any products, implement sorting, viewing

class ProductCollection
	
	def initialize(products)
		@products = products
	end

	def self.from_dir(path_to_dir) # Path to data folder
		# Create collection from folder with auto sorting
		
		products = Hash.new { |hash, key| hash[key] = [] }
		productFolders = Dir[path_to_dir + "/*"].map{ |str| str.split("/")[-1] }

		for productFolder in productFolders

			case productFolder # To-do: reconstruct to any folders (not only films and books)
			when "films"
				
				product_files = Dir["#{path_to_dir}/#{productFolder}/*"].map{ |str| str.split("/")[-1] }
				for file in product_files
					film = Film.from_file("#{path_to_dir}/#{productFolder}/#{file}")
					
					products["films"] << film
				end

			when "books"

				product_files = Dir["#{path_to_dir}/#{productFolder}/*"].map{ |str| str.split("/")[-1] }
				for file in product_files
					book = Book.from_file("#{path_to_dir}/#{productFolder}/#{file}")
					products["books"] << book
				end

			end

		end

		# Products collection created

		self.new(products)
		
		# Product collection saved
	end

	def to_a()
		# Return all products array
		
		all_products_arr = []
		for product_type in @products.keys
			all_products_arr += @products[product_type]

		end

		return all_products_arr
	end

	def to_s
		input_arr = self.sort()
		output_str = ""

		output_str += "Products in productCollection class: \n"
		output_str += "#{"-" * 40}\n" 

		index = 1
		for product in input_arr
			output_str += "#{index.to_s}. #{product.to_s}\n"
			index += 1
		end

		output_str += "#{"-" * 40}\n" 

		return output_str
	end

	def sort(sort_products_type = "all", sort_param = "name", reverse = false)
		
		sorted_products = []
		what_to_sort = []

		if sort_products_type.empty? || sort_products_type == "all"
			what_to_sort = self.to_a
		else
			what_to_sort = @products[sort_products_type]
		end

		case sort_param
		when "name"
			sorted_products = what_to_sort.sort_by{ |product| product.name }
		when "cost"
			sorted_products = what_to_sort.sort_by{ |product| product.cost }
		when "stock"
			sorted_products = what_to_sort.sort_by{ |product| product.stock }
		else
			puts("Sort param check fail")
		end

		if reverse
			sorted_products.reverse!
		end

		return sorted_products
	end
end