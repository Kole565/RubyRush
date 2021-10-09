require_relative "../scripts/get_user_inp.rb"

# Get user input read data from console => need semi-automate testing

tests = [
	{
		"text": "Enter value 'test'",
		"options":
		{
			"value_type": "value",
			"is_hidden": false
		},
		"condition": "test",
		"succed": false
	},
	{
		"text": "Enter several values: 'one', 'two', 'three'",
		"options": 
		{
			"value_type": "list",
			"is_hidden": false
		},
		"condition": ['one', 'two', 'three'],
		"succed": false
	},
	{
		"text": "Enter several values (hash): 'k1' => 'v1', 'k2' => 'v2'",
		"options":
		{
			"value_type": "hash",
			"is_hidden": false
		},
		"condition": {"k1": "v1", "k2": "v2"},
		"succed": false
	}
]

# for test in tests
# 	puts test[:text]
# 	value = get_user_inp(test[:options])
	
# 	if value == test[:condition]
# 		test[:succed] = true
# 	else
# 		test[:got] = value
# 	end

# 	puts
# end

# puts "Results: "

# index = 1
# for test in tests
	
# 	if test[:succed]
# 		puts "#{index}. Success"
# 	else
# 		puts "#{index}. Fail"
# 		puts "#{test[:text]}"
# 		puts "\tExpect: #{test[:condition]}"
# 		puts "\tGot: #{test[:got]}\n"
# 	end

# 	index += 1
# end