current_path = File.dirname(__FILE__)
file_path = current_path + "/data/aphorizmus.txt"

if (File.exist?(file_path))
	f = File.new(file_path, "r:UTF-8")
	lines = f.readlines()
	f.close

	puts("Случайный афоризм: ")
	puts
	puts(lines.sample)
else
	puts("Файл не найден")
end

