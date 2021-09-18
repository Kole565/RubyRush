require_relative "../utils/methods.rb"

# A * x^2 + B * x + C = 0

puts "Enter A:"
a = get_console_inp.to_f

puts "Enter b:"
b = get_console_inp.to_f

puts "Enter c:"
c = get_console_inp.to_f

disc = b ** 2 - 4 * a * c

if disc > 0
	x_1 = (-b + Math::sqrt(disc)) / (2 * a)
	x_2 = (-b - Math::sqrt(disc)) / (2 * a)
end

puts "Results:"
puts x_1
puts x_2