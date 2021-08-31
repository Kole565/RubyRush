require "time"

class Pomodoro
	
	def initialize(startTime, duration)
		@startTime = startTime # In seconds from world creation
		@duration = duration # In seconds
		@is_paused = false
		@is_end = false
	end

	def startTime
		return @startTime
	end

	def duration
		return @duration
	end

	def is_paused
		return @is_paused
	end

	def checkStatus()
		# Return -1, 0, 1 for three conditions: overdue, paused, goes on

		if is_paused
			return 0
		elsif (startTime + duration) > Time.now.to_i
			return 1
		else
			return -1
		end

	end

	def pause
		if !is_end
			if !@is_paused
				@is_paused = true
				remainder = duration - (Time.now.to_i - startTime)
			else
				@is_paused = false
			end
		end
	end
end