def saveRecord(record, file)
	file.puts(Time.now.strftime("%H:%M"))
	
	record.pop
	for line in record
		file.puts(line)
	end

	file.puts("---------------------------")
end

def get_value()
	inp = nil
	
	while (inp == nil)
		inp = STDIN.gets.encode("UTF-8").chomp
	end

	return inp
end