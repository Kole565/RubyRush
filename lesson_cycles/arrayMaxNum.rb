puts("Какой длины будет массив случайных чисел?")

while (true)
	array_len = gets.encode("UTF-8").chomp.to_i

	if (array_len >= 1)
		break
	end
end

array = []
index = 1
max_num = 0

while (index <= array_len)
	value = rand(101)
	if (value > max_num)
		max_num = value
	end

	array << value
	index += 1
end

puts(array.to_s)
puts("Самое большое число: ")
puts(max_num)