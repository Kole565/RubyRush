require "E:/Documents_Large/NeedMoreCode/RubyRush/utils/methods.rb"

class Link < Post
	
	def initialize()
		super

		@url = ""
	end

	def url
		return @url
	end

	def read_from_console()
		puts("Введите ссылку: ")
		@url = get_console_inp(exit_inp = "end")

		puts("Введите описание ссылки: ")
		@text = get_console_inp(exit_inp = "end")
	end

	def to_strings()
		time_string = "Created: #{@creation_time.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

		return [@url, @text, time_string]
	end

	def to_db_hash
		return super.merge (
			{
				"text" => text,
				"url" => url
			}
		)
	end

	def load_data(data_hash)
		super
		
		@url = data_hash["url"]
	end

end