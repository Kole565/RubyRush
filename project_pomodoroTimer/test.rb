require "time"
require_relative "pomodoroClass.rb"

puts("Now #{Time.now}")

test_pomodoro = Pomodoro.new(Time.now.to_i, 3)

puts("Pomodoro status: ")

status = 1
while status != -1
	status_str = ""
	status = test_pomodoro.checkStatus()
	
	case status
	when -1
		status_str = "Overdue"
	when 0
		status_str = "Paused"
	when 1
		status_str = "Goes on"
	end
	
	print("#{status_str}\r")
end

puts("#{status_str}")

puts("Pomodoro test completed")