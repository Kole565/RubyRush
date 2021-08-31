global_path = File.dirname(__FILE__)

require (global_path + "/../utils/methods.rb")

dice_edges = 6

def get_roll(dice_edges)
	return rand(dice_edges) + 1
end

def dice_spin(dice_edges, spin_rate, duration) # duration in seconds
	duration *= 100
	for x in 0..duration do
		print("#{get_roll(dice_edges)}\r")
		sleep(1 / spin_rate)
	end
end


puts("Roll dice programm")
puts("How many dice?")

inp = get_console_inp()
puts
inp = inp.to_i - 1

sum = 0
for x in 0..inp
	dice_spin(dice_edges, 5, 50)
	
	val = get_roll(dice_edges)
	puts(val)
	
	sum += val
end
puts("Sum: #{sum}")