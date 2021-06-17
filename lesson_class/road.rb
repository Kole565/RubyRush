require "./bridgeClass"

bridge = Bridge.new

# puts("Барабанная дробь...")
# sleep(3)
# puts("Ииии...")
# sleep(3)
# puts("Bridge это: #{Bridge.class.name}!")
# sleep(1)
# puts("Facepalm")

if (!bridge.is_opened?())
	bridge.open()
end