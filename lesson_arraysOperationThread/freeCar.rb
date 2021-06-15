cars = [
    "acura",
    "alfa romeo",
    "aston martin",
    "audi",
    "bentley",
    "BMW",
    "bugatti",
    "buick",
]

puts("У нас всего " + cars.count().to_s + " машин. Вам какую?")

while (true)
    choice = gets.encode("UTF-8").chomp.to_i

    if (choice > 0 && choice <= cars.count)
        puts("Поздравляем, вы получили: ")
        puts(cars[choice - 1].capitalize())
        break()
    else
        puts("Извините, машины с таким номером у нас нет :(")
        puts("Выберите другой номер")
    end
end