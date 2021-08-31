require "E:/Documents_Large/NeedMoreCode/RubyRush/utils/methods.rb"

class Memo < Post

	def read_from_console()
		puts("Заметка: (введите end для завершения ввода)")

		line = ""
		while line != "end"
			line = get_console_inp()
			@text << line
		end

		@text.pop
	end

	def to_strings()
		time_string = "Created: #{@creation_time.strftime("%Y.%m.%d, %H:%M:%S")} \n"

		return @text.unshift(time_string)
	end

end