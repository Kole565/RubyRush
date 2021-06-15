# Set up
num = rand(16)
trys = 3

puts("Загадано число от 0 до 16, отгадайте какое?")
while (trys > 0)
    res = ""
    choice = gets.encode("UTF-8").chomp().to_i

    if (choice < 0 || choice > 15)
        trys += 1
        puts("Выберите число от 0 до 16")
    end

    if (choice == num)
        res += "Ура, вы выиграли!"
    elsif (choice >= num - 2 && choice <= num + 2)
        res += "Тепло "
    else
        res += "Холодно "
    end
    
    if (choice < num && res != "Ура, вы выиграли!") 
        res += "(нужно больше)"
    elsif (res != "Ура, вы выиграли!")
        res += "(нужно меньше)"
    end
    
    puts(res)

    if (res == "Ура, вы выиграли!")
        abort
    else
        trys -= 1
    end
end