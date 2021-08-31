current_path = File.dirname(__FILE__)
file_path = current_path + "/data/aphorizmus.txt"

if (File.exist?(file_path))
	file = File.new(file_path, "r:UTF-8")
	content = file.read()
	f.close

	puts("Великие люди говорили: ")
	puts
	puts(content.to_s)
else
	puts("Файл не найден")
end