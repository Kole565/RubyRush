require_relative "./table.rb"

class Visualizer

	# Show hash data in various forms
	def self.format(data, mode = "table", options = {})
		
		case mode
		when "table"
			formated_data = create_table(data) # Data = table object
			visualized = view_table(formated_data, options)
		end
		
		visualized
	end

	def self.create_table(data)
		max_table_len = 0
		
		for key in data.keys

			if data[key].size > max_table_len
				max_table_len = data[key].size
			end

		end

		table = Table.new(data.keys.size, max_table_len + 1)

		headers_temp = []

		for header in data.keys
			headers_temp << "#{header.capitalize}"
		end

		table.set_header(headers_temp)
		# Header setup complete
		
		data.keys.each_with_index do | key, key_ind |

			data[key].each_with_index do | item, item_ind |
				
				table.set_element(key_ind + 1, item_ind + 1, item)
			end

		end

		table
	end

	def self.view_table(table, options = {})
		# Work like to_s for table
		# Get options in hash:
		# :x_size = max value length (symbols)
		# :start_sym = symbol before table
		# :splitter = symbol amoung rows
		# :end_sym = symbol after table
		# :header_horizontal_split = true or false set line after header

		options[:x_size] = 10 if !options.keys.include? :x_size
		options[:splitter] = "|" if !options.keys.include? :splitter
		options[:horizontal_split] = false if !options.keys.include? :horizontal_split

		result = ""

		# Add header
		header_text = ""

		header_text += options[:start_sym] if options.keys.include? :start_sym

		for header in table.header
			header_text += format_str_length(header, options[:x_size])

			header_text += options[:splitter] if header_text.length <
			(options[:x_size]) * table.header.size # If not last header add splitter
		end

		header_text += options[:end_sym] if options.keys.include? :end_sym
		header_text += "\n"


		# Calc hor split if enabled
		horizontal_split = ""
		if options[:horizontal_split]

			horizontal_split += "-" * (options[:x_size] * table.header.size)
			horizontal_split += "-" * (table.header.size - 1)

			horizontal_split += "-" * options[:start_sym].length if options.keys.include? :start_sym
			horizontal_split += "-" * options[:end_sym].length if options.keys.include? :end_sym

			horizontal_split += "\n"
		end


		# Add rows
		rows_text = ""
		
		for row in table.data
			row_text = ""

			row_text += options[:start_sym] if options.keys.include? :start_sym

			for item in row
				item = "" if item == nil
				row_text += format_str_length(item, options[:x_size])

				row_text += options[:splitter] if row_text.length <
				(options[:x_size]) * row.size # If not last row add splitter
			end

			row_text += options[:end_sym] if options.keys.include? :end_sym

			rows_text += "#{row_text}\n"

		end
		
		result += header_text
		result += horizontal_split
		result += rows_text

		result
	end

	def self.format_str_length(item_str, max_len)
		# Format value to fil the len:
		# len = 5; value = testing => "testi"
		# len = 10; value = testing => "testing   "

		if item_str.length > max_len
			item_str = item_str[0..max_len - 1]
		elsif item_str.length < max_len
			item_str += " " * (max_len - item_str.length)
		end

		item_str
	end
	
end