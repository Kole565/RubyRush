def sklonit (num, word_forms)

	if (num == nil || !num.is_a?(Numeric))
		num = 0
	end

	if (num == 1)
		return "#{num.to_s} #{word_forms[0]}"

	elsif (num >= 2 && num <= 4)
		return "#{num.to_s} #{word_forms[1]}"

	elsif (num >= 5 && num <= 20)
		return "#{num.to_s} #{word_forms[2]}"
	
	elsif (num % 10 == 1)
		return "#{num.to_s} #{word_forms[0]}"
	
	elsif (num % 10 >= 2 && num % 10 <= 4)
		return "#{num.to_s} #{word_forms[1]}"
	
	elsif (num % 10 >= 5 || num % 10 == 0)
		return "#{num.to_s} #{word_forms[2]}"
	end
end

puts("Введите число: ")

while (true)
	input = STDIN.gets.encode("UTF-8").chomp

	if (input == input.to_i.to_s)
		break
	end
end

puts(sklonit(input.to_i, ["krocodil", "krocodila", "krocodilov"]))

x = 0
while x <= 1000
	puts(sklonit(x, ["rubl", "rubla", "rubley"]))
	x += 1
end