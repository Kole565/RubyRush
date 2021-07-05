inp = ""
if (!ARGV[0])
	puts("Введите слово для проверки: ")

	while (inp == "" || inp == nil)
		inp = STDIN.gets.encode("UTF-8").downcase.chomp
	end

else
	inp = ARGV[0].encode("UTF-8").downcase.chomp
end

word = inp.strip()
	
if (word == word.reverse)
	puts("#{word.capitalize} - палиндром")
else 
	puts("#{word.capitalize} - не палиндром")
end