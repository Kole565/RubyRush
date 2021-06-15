def cut_array (cuting_len, source_array)
	
	if (cuting_len == nil || !cuting_len.is_a?(Numeric))
		cuting_len = 3
	end
	
	if (source_array == nil || !source_array.is_a?(Array))
		source_array = [1, 2, 3]
	end
	
	res = []

	index = 0
	while index < cuting_len
		
		if (source_array[index])
			res << source_array[index]
		end
		index += 1
	end

	return res
end

sausage_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

puts("Вот какая палка колбасы у нас есть: ")
puts(sausage_array.to_s)

puts("Сколько первых элементов вам отрезать?")
while (true)
	choice_len = STDIN.gets.encode("UTF-8").chomp
	choice_len = choice_len.to_i

	if (choice_len != nil && choice_len.is_a?(Numeric))
		break
	end
end

puts("Вот ваша колбаса: ")
puts(cut_array(choice_len, sausage_array).to_s)