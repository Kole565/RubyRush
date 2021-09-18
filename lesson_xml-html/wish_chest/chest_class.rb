require "rexml/document"
require "date"

require_relative "../../utils/methods.rb"

class Chest
	# Chest with wishes class
	def initialize()
		@storage = open_storage("/data/wishes.xml")
		data = get_input()
		save_data(@storage, data)
		push(@storage, "/data/wishes.xml")

	end

	def open_storage(path_to_storage_folder)
		current_path = File.dirname(__FILE__)
		file_name = current_path + path_to_storage_folder

		abort "File not founded" unless File.exist?(file_name)

		file = File.new(file_name, "r:UTF-8")
		doc = REXML::Document.new(file)
		file.close
		
		return doc
	end

	def get_input() # Get field from user
		inp = ""
		while inp != "exit"
			puts("What you want?")
			wish_name = get_console_inp(exit_inp = "exit")

			puts("Before when you want?")
			wish_overdue_time = Date.parse(get_console_inp(exit_inp = "exit"))

			puts("You wish in the chest")
			return [wish_name, wish_overdue_time]
		end

		
	end

	def save_data(doc, data) # Save one field or object
		wishes = doc.elements.find("wishes").first

		wish = wishes.add_element "wish", {
			"date" => data[1].strftime("%d.%m.%Y")
		}
		wish.text = data[0]
	end

	def push(data, file_path) # Apply changes in storage
		current_path = File.dirname(__FILE__)
		file_name = current_path + file_path

		abort "File not founded" unless File.exist?(file_name)

		file = File.new(file_name, "w:UTF-8")
		data.write(file, 2)
		file.close
	end

end

chest = Chest.new()