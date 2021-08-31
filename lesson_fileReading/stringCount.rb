current_path = File.dirname(__FILE__)

if (ARGV[0])
	file_path = current_path + ARGV[0]
else
	puts("Нужно передать путь к файлу в первом консольном аргументе")
	abort
end

if (File.exist?(file_path))
	file = File.new(file_path, "r:UTF-8")
	lines = file.readlines

	empty_lines = 0
	for line in lines
		if (line == "\n")
			empty_lines += 1
		end
	end

	more_then_five = false
	if (lines.count >= 5)
		more_then_five = true
	end

	file.close
else
	puts("Файл не существует")
	abort
end

puts("Открыт файл: #{file_path}")
puts("Всего строк: #{lines.count}")
puts("Пустых строк: #{empty_lines}")
if (more_then_five)
	puts("Последние пять строк: ")
	puts
	puts(lines[-5])
	puts(lines[-4])
	puts(lines[-3])
	puts(lines[-2])
	puts(lines[-1])
end