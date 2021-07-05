global_path = File.dirname(__FILE__)
films_list_path = "/data/filmsList.txt"

path = global_path + films_list_path

if (File.exist?(path))
	file = File.new(path, "r:UTF-8")
	films_list = file.readlines

	films_names = []
	films_descs = []

	now_name = true
	
	for film in films_list

		if (now_name)
			films_names << film
		else
			films_descs << film
		end

		now_name = !now_name
	end
	
	file.close
else
	puts("Films list file not found")
end

rand_index = rand(films_list.count / 2)
puts(films_names[rand_index])
puts(films_descs[rand_index])