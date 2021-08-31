require_relative("productClass.rb")
require_relative("methods.rb")

class Book < Product
	
	def initialize(cost, stock, name, genre, author)
		# Call parent constructor
		super(cost, stock)

		# Add special var's
		@name = name.downcase
		@genre = genre.downcase
		@author = author.downcase
	end

	def name
		return @name.capitalize
	end

	def genre
		return @genre
	end

	def author
		return @author.split.map(&:capitalize)*' '
	end

	def to_s
		return "Book <<#{name}>>, #{genre}, author - #{author}, #{cost} rub. (stock #{stock})"
	end

	def self.from_file(file_path)
		text = get_lines_from_file(file_path)

		text.each_with_index do | attribute, index |
			if attribute.empty?
				text[index] = "Nan"
			end
		end

		self.new(text[3], text[4], text[0], text[1], text[2])
	end

end