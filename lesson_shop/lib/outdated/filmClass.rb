require_relative("productClass.rb")
require_relative("methods.rb")

class Film < Product

	def initialize(cost, stock, name, create_year, director)
		# Call parent constructor
		super(cost, stock)

		# Add special var's
		@name = name.downcase
		@create_year = create_year.to_i
		@director = director.downcase
	end

	def name
		return @name.capitalize
	end

	def create_year
		return @create_year
	end

	def director
		return @director.split.map(&:capitalize)*' '
	end

	def to_s
		return "Film <<#{name}>>, #{create_year}, dir. #{director}, #{cost} rub. (stock #{stock})"
	end

	def self.from_file(file_path)
		text = get_lines_from_file(file_path)

		text.each_with_index do | attribute, index |
			if attribute.empty?
				text[index] = "Nan"
			end
		end
		
		self.new(text[3], text[4], text[0], text[2], text[1])
	end

end