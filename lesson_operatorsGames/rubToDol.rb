puts("Сколько сейчас стоит 1 доллар в рублях?")
dol_value = gets.encode("UTF-8").chomp().to_f

puts("Сколько  у вас рублей?")
rub_amount = gets.encode("UTF-8").chomp().to_f

res = (rub_amount / dol_value).round(2)
puts("Это " + res.to_s +  "$")