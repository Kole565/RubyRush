class Task < Post
	
	def initialize()
		super

		@overdue_time = Time.now
	end

	def read_from_console()
	end

	def to_strings()
	end

end