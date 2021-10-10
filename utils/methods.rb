require "io/console"

def get_console_inp(hidden = false, exit_inp = nil)
	# Get input from user
	# Can get hidden inp and have custom exit inp value
	
	inp = ""
	
	if (hidden == true)
		
		while (inp == "" || inp == nil)
			inp = STDIN.noecho(&:gets).chomp
		end

	else
	
		while (inp == "" || inp == nil)
			inp = STDIN.gets.encode("UTF-8").chomp
		end

	end

	if (exit_inp != nil && inp.downcase == exit_inp.downcase)
		return false
	else
		return inp
	end

end