class Table

	def initialize(colomns, rows)
		@header = []
		# Header (example):
		# ["hashtags", "phones", "mails"]

		@data = []
		# Data not include header
		# Data (example):
		# [
		#	["SomeTag", "+ Phone", "sdf@maon.f"]
		#	["NewhashTag", "+ 8 hone", ""]
		# ]

		data_init(rows)
		fill(colomns, rows)
	end

	def header
		@header
	end

	def data
		@data
	end

	def row(index = 0)
		@data[index]
	end

	def set_element(x, y, value)
		# Set data[position] = value
		@data[y - 1][x - 1] = value
	end

	def set_header(values)
		values.each_with_index do | value, val_ind |
			@header[val_ind] = value
		end
	end

	def fill(x_size, y_size, filler = nil)
		# Set table structure

		# Fill header
		@header = Array.new(x_size, filler)

		# Fill rows
		for y_ind in 0..y_size - 2
			fill_row(x_size, y_ind)
		end

	end

	def fill_row(x_size, index, filler = nil)
		# Add array to data
		@data[index] = Array.new(x_size, filler)
	end

	def data_init(y_size, filler = nil)
		# Set data = array
		@data = Array.new(y_size - 1, filler)
	end

end