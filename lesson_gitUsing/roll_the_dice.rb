puts("Roll dice programm")

dice_edges = 6

for x in 0..10
	puts("Number is - #{rand(dice_edges) + 1}")
end

def get_roll(dice_edges)
	return rand(dice_edges) + 1
end

def dice_spin(dice_edges, spin_rate, duration) # duration in seconds
	duration *= 100
	for x in 0..duration do
		puts("#{get_roll(dice_edges)}")
		sleep(1 / spin_rate)
		Gem.win_platform? ? (system "cls") : (system "clear")
	end
	puts(get_roll(dice_edges))
end

dice_spin(dice_edges, 5, 2)