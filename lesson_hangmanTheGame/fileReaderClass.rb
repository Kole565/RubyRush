class FileReader

	def read_from_file(global_path, file_path)
		# Note: Use exceptions here (uncomplete)
		
		path = global_path + file_path

		file = File.new(path, "r:UTF-8")
		
		return file.readlines.sample.chomp
	end

end