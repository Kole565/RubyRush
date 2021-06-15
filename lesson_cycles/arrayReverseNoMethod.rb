start_array = [1, 2, 3, 4, 5, 6, 7]
res_array = []

for item in start_array do
	res_array.unshift(item)
end

puts("Исходный массив: ")
puts(start_array.to_s)

puts("Новый массив, полученный из исходного: ")
puts(res_array.to_s)