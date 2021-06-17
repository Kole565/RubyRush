class Bridge
	
	def initialize
		puts("Мост построен!")	
		@opened = false
	end

	def open
		@opened = true
		puts("Мост открыт")
	end

	def close
		@opened = false
		puts("Мост закрыт")
	end

	def is_opened?
		return @opened
	end			
end