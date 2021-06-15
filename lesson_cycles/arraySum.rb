puts("Введите N")

while (true)
	array_len = gets.encode("UTF-8").chomp.to_i

	if (array_len >= 1)
		break
	end
end

array = []
sum = 0
n = 1

while (n <= array_len)
	array << n
	sum += n
	n += 1
end

puts(array.to_s)
puts("Сумма чисел: " + sum.to_s)