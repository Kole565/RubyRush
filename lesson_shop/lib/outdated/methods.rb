def get_lines_from_file(file_path)
	
	# Get and return lines array from opened file
	file = File.open(file_path, "r:UTF-8")

	text = []
	text = file.readlines(chomp: true)

	file.close

	return text
end