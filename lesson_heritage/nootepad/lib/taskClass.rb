require "date"
require "E:/Documents_Large/NeedMoreCode/RubyRush/utils/methods.rb"

class Task < Post
	
	def initialize()
		super

		@overdue_time = Time.now
	end

	def read_from_console()
		puts("Задача: ")
		@text = get_console_inp()

		puts("Deadline: (dd.mm.yy like 01.01.2001)")
		inp = get_console_inp()

		@overdue_time = Date.parse(inp)
	end

	def to_strings()
		time_string = "Created: #{@creation_time.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

		deadline = "Deadline: #{@overdue_time}"

		return [deadline, @text, time_string]
	end

end