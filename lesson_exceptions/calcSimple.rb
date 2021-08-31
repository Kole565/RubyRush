# Simple calc. Don't have any protection from errors. Should get two num's and do stuff with it (+-*/)
#
# Add ZeroDivisionError catch

global_path = File.dirname(__FILE__)

require (global_path + "/../utils/methods.rb")

puts("Simple calc")

puts("Enter first num: ")
first_num = get_console_inp(exit_inp = "x")

puts("Enter second num: ")
second_num = get_console_inp(exit_inp = "x")

puts("What operation you want? (+ - * /)")
operation = get_console_inp()

begin
	result = ""
	case operation
	when "+"
		result = first_num.to_f + second_num.to_f
	when "-"
		result = first_num.to_f - second_num.to_f
	when "*"
		result = first_num.to_f * second_num.to_f
	when "/"
		result = first_num.to_f / second_num.to_f
	else
		result = "Operation not supported"
	end
rescue ZeroDivisionError
	puts("Don't divide by 0")
else
	puts("Result: ")
	puts(result)
end




