# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

heroes = [
	"бэтмэн",
	"шерлок холмс",
	"буратино",
	"фродо бэггинс",
	"моцарт",
	"программист",
]

evils = [
	"джокер",
	"мориарти",
	"крабас-барабас,",
	"саурон",
	"сальери",
	"лень",
]

while (true)
	inp = ""
	puts("Врага какого персонажа вы хотите узнать?")

	while (inp == "" || inp == nil || !heroes.include?(inp) && inp != "end")
		inp = STDIN.gets.encode("UTF-8").chomp.downcase
	end

	case inp
	when heroes[0]
		puts(evils[0].capitalize)
	when heroes[1]
		puts(evils[1].capitalize)
	when heroes[2]
		puts(evils[2].capitalize)
	when heroes[3]
		puts(evils[3].capitalize)
	when heroes[4]
		puts(evils[4].capitalize)
	when heroes[5]
		puts(evils[5].capitalize)
	when "end"
		break
	else
		puts("Nothing")
	end

end


