# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

require ("./filmClass")

films = []
scenarist = ""

puts("Фильмы какого режиссера Вы хотите посмотреть?")

inp = ""
while (inp == "" || inp == nil)
	inp = STDIN.gets.encode("UTF-8").chomp.downcase
end

scenarist = inp

n = 0
while n < 3

	puts("Какой-нибудь его хороший фильм?")
	
	inp = ""
	while (inp == "" || inp == nil)
		inp = STDIN.gets.encode("UTF-8").chomp.downcase
	end

	film = Film.new(inp, scenarist)
	films << film

	n += 1
end

puts("И сегодня вечером рекомендую посмотреть: #{films.sample.name.capitalize}")
puts("Режиссера: #{scenarist.capitalize}")