$a = "GLOBAL"
b = "Local"

def method
	c = "super local"

	puts("In method: ")
	puts("Var a is: #{defined?($a)}")
	puts("Var b is: #{defined?(b)}")
	puts("Var c is: #{defined?(c)}")
end

puts("In programm: ")
puts("Var a is: #{defined?($a)}")
puts("Var b is: #{defined?(b)}")
puts("Var c is: #{defined?(c)}")

puts
method