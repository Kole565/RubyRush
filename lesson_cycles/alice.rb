names = []
user_inp = nil

while (user_inp != "") do
	user_inp = gets().encode("UTF-8").chomp
	names.push(user_inp)
end

for name in names do
	puts("Привет " + name + " !")
	sleep 1
	
	if (name == "Элис")
		sleep 1
		break
	end
end

puts("Элис!?")
sleep 1
puts("Элис кто ты!?")
sleep 1
puts("Что ты здесь делаешь!?")
sleep 1
puts("Элииииииииииииииииииииииииииииииииииииииииис...")