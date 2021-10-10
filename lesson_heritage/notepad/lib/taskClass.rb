require "date"
require "E:/Documents_Large/NeedMoreCode/RubyRush/utils/methods.rb"

class Task < Post
	
	def initialize()
		super

		@overdue_date = Time.now
	end

	def overdue_date
		return @overdue_date
	end

	def read_from_console()
		puts("Задача: ")
		@text = get_console_inp()

		puts("Deadline: (dd.mm.yy like 01.01.2001)")
		inp = get_console_inp()

		@overdue_date = Date.parse(inp)
	end

	def to_strings()
		time_string = "Created: #{@creation_time.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

		deadline = "Deadline: #{@overdue_date}"

		return [deadline, @text, time_string]
	end

	def to_db_hash
		return super.merge (
			{
				"text" => @text,
				"overdue_date" => @overdue_date.to_s
			}
		)
	end

	def load_data(data_hash)
		super(data_hash)
		
		@overdue_date = Date.parse(data_hash["overdue_date"])
	end

end