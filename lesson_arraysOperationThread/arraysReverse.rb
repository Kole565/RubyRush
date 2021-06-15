start_array = [1, 2, 3, 4, 5]

puts("Исходный массив: \n" + start_array.to_s)

puts("Массив в обратном порядке: \n" + start_array.reverse().to_s)

puts("Исходный массив (не изменился): \n" + start_array.to_s)

start_array.reverse!()

puts("Исходный массив (после изменения): \n" + start_array.to_s)