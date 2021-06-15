season = ARGV[0]
temperature = ARGV[1]

variants = [
	"Скорее идите в парк, соловьи поют!",
	"Сейчас соловьи молчат, греются или прохлаждаются :)",
	"Соловьи поют! Зимой!"
]

# If does't have first console argument => ask

if (!ARGV[0] && Gem.win_platform?)
	puts("Какое сейчас время года?")
	puts("1. Весна")
	puts("2. Лето")
	puts("3. Осень")
	puts("4. Зима")

	while (season != "1" && season != "2" && season != "3" && season != "4")
		season = STDIN.gets.encode("UTF-8").chomp
	end
end

# If does't have second console argument => ask

if (!ARGV[1] && Gem.win_platform?)
	puts("Какая сейчас температура?")
	
	while (true)
		temperature = STDIN.gets.encode("UTF-8").chomp

		if (temperature == temperature.to_i.to_s) # Way to check type
			break                                 # Don't wotk in python btw
		end
	end	
end

# If user first input = string => convert to num

if (season.downcase() == "весна" || season == "1")
	season = 0

elsif (season.downcase() == "лето" || season == "2")
	season = 1

elsif (season.downcase() == "осень" || season == "3")
	season = 2

elsif (season.downcase() == "зима" || season == "4")
	season = 3

else
	puts("Неверное время года") # Never be called
end

# If user second input = string => convert to num

if (ARGV[1] && Gem.win_platform?)
	temperature = temperature.encode("UTF-8").chomp.to_i
end

# Robins singing check:
# If temperature 22 - 30 degree in any season
# or 15 - 35 degree in summer

if (temperature >= 15 && temperature <= 35 && season == 1)
	puts(variants[0])

elsif (temperature >= 22 && temperature <= 30)

	if (season == 3)
		puts(variants[2])
	else
		puts(variants[0])
	end

else
	puts(variants[1])
end