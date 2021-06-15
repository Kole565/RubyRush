def createSky (stars_amount)
	stars_amount = stars_amount.to_i

	if (stars_amount == nil || !stars_amount.is_a?(Numeric))
		stars_amount = 0
	end

	res = "*" * stars_amount.abs
	
	return res 
end

puts(createSky("100"))

puts("Сколько вам звезд на погоны?")
while (true)
	choice_len = STDIN.gets.encode("UTF-8").chomp
	choice_len = choice_len.to_i

	if (choice_len != nil && choice_len.is_a?(Numeric))
		break
	end
end

puts("Вот ваши звезды :) ")
puts(createSky(choice_len).to_s)