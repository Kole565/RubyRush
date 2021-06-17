require "./humanClass"

house_holders = [
Gavric = Human.new("Гаврила", "Петрович", 35),
Fedor = Human.new("Фёдор", "Петрович", 40),
Vasya = Human.new("Василий", "Алибабаевич", 88),
]

puts("У нас три жильца: ")

for human in house_holders
	puts(human.who())
	puts(human.how_old())
end