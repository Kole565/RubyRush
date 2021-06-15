argument = ARGV[0]

if (Gem.win_platform? && ARGV[0])
	argument = argument.encode("UTF-8")
end

if (argument == nil)
	argument = "Анонимус"
end

if (argument == "Дурак" || argument == "дурак")
	puts("Сам дурак!")
else
	puts("Приветствую, #{argument}!")
end