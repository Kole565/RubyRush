require "io/console"

def get_user_inp(options = {})
    # Get, save input
    # 	@type - single value, list or hash
    # 	@hidden - hide input (passwords)

	user_input = nil

	case options[:type]
	when "value"		
		user_input = get_single_value(options[:hidden])
	when "list"
		user_input = get_list(options[:hidden])
	when "hash"
		user_input = get_hash(options[:hidden])
	end

	user_input
end

def get_single_value(hidden)
	# Get single value
	# Get hidden inp arg

	inp = ""

	if hidden

		# noecho to hide input
		inp = STDIN.noecho(&:gets).chomp

	else

		inp = STDIN.gets.encode("UTF-8").chomp

	end

	inp
end

def get_list(hidden)
	# Get list of values
	inp = []
	
	index = 1
	single_value = nil
	while true
		puts "Enter value № #{index}: "

		single_value = get_single_value(hidden)

		if single_value == ""
			break
		end

		inp << single_value

		index += 1
	end
	
	inp
end

def get_hash(hidden)
	# Get couple key-value
	# Create hash, return
	inp = {}

	index = 1
	single_value, key, value = nil
	while true
		puts "Enter key № #{index}: "

		key = get_single_value(hidden)

		puts "Enter value № #{index}: "

		value = get_single_value(hidden)

		if key == "" || value == ""
			break
		end

		inp[key] = value

		index += 1
	end
	
	inp
end