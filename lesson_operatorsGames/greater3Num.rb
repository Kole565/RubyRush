puts("Введите первое число: ")
num_1 = gets.encode("UTF-8").chomp().to_i()

puts("Введите второе число: ")
num_2 = gets.encode("UTF-8").chomp().to_i()

puts("Введите третье число: ")
num_3 = gets.encode("UTF-8").chomp().to_i()

# Result calc
res = (num_1 + num_2 + num_3) / 3

# Result - average number
puts("Среднее этих трех чисел: " + res.to_s())