variable = "value"

class MyClass
	
	def initialize(value="class value")
		@variable = value
	end

	def check_variables()
		puts("Var variable in programm is: #{defined?(variable)}")
		puts("Var variable in class is: #{defined?(@variable)}")
	end

end

testClass = MyClass.new()

puts("Check in class: ")
testClass.check_variables()

puts("Check in programm: ")
puts("Var variable in programm is: #{defined?(variable)}")
puts("Var variable in class is: #{defined?(@variable)}")