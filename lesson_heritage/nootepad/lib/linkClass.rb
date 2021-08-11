require "E:/Documents_Large/NeedMoreCode/RubyRush/utils/methods.rb"

class Link < Post
	
	def initialize()
		super

		@url = ""
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

end