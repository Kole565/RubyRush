puts("Конвертер валют\n")

puts("Выберите целевую валюту:")
puts("\t1. Доллар")
puts("\t2. Рубль")

choice = gets.encode("UTF-8").chomp()

puts("Сколько сейчас стоит 1 доллар в рублях?")
dol_value = gets.encode("UTF-8").chomp().to_f

if (choice == "1")
    puts("Сколько  у вас рублей?")
    rub_amount = gets.encode("UTF-8").chomp().to_f

    res = (rub_amount / dol_value).round(2).to_s + " USD"
elsif (choice == "2")
    puts("Сколько  у вас долларов?")
    dol_amount = gets.encode("UTF-8").chomp().to_f

    res = (dol_amount * dol_value).round(2).to_s + " RUB"
end

puts("У вас в запасе " + res)