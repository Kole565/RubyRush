# States and source
turns = ["Камень", "Ножницы", "Бумага"]
gameEnd = false
pc_win = false

# Name and description
puts("Камень — Ножницы — Бумага")
puts("\tСыгрфй в КНБ с компьютером!")

while (!gameEnd)
    pc_win = false
    
    puts("\nВыберите ход: ")
    puts("1. Камень")
    puts("2. Ножницы")
    puts("3. Бумага")
    
    choice = gets.encode("UTF-8").chomp().to_i - 1
    pc_choice = rand(3)

    if (choice != -1)
        puts("Вы выбрали: " + turns[choice])
        puts("Компьютер выбрал: " + turns[pc_choice])
    else
        abort()
    end
    
    if (choice == pc_choice)
        puts("Ничья!")
    
    elsif (choice == 0)
        if (pc_choice == 1)
            puts("Победил Игрок")
        elsif (pc_choice == 2)
            puts("Победил Компьютер")
        end
    
    elsif (choice == 1)
        if (pc_choice == 0)
            puts("Победил Компьютер")
        elsif (pc_choice == 2)
            puts("Победил Игрок")
        end
    
    elsif (choice == 2)
        if (pc_choice == 0)
            puts("Победил Игрок")
        elsif (pc_choice == 1)
            puts("Победил Компьютер")
        end
    
    else
        abort()
    end
end