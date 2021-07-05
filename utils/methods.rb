require("io/console")

def get_console_inp(hidden = false, exit_inp = nil)
	# Get input from user
	# Can get hidden inp and have custom exit inp value
	# Tested
	# Work and useful
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

def work_with_file(full_file_path = "", work_func = test(), mode = "a", *work_func_args)
	# Don't tested
	# Usless => should be deleated
	if (File.exist?(full_file_path))
		file = File.new(full_file_path, "#{mode}:UTF-8")
		
		case mode
		when "r"
			output = work_func(file)
		else
			work_func(file)
		end

		file.close

		if (output)
			return output
		end
		
	else
		return
	end

end

def test()
	return "Test func from methods.rb in utils"
end