def curcleAreaCalc (radius)
	if (radius == nil || !radius.is_a?(Float))
		radius = 0
	end
	
	res = (radius * radius) * 3.14

	return res
end

puts("Введите число: ")

while (true)
	input = STDIN.gets.encode("UTF-8").chomp

	if (input == input.to_i.to_s)
		break
	end
end

puts(curcleAreaCalc(input.to_f))