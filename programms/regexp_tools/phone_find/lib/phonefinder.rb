class PhoneFinder
	# Static class. Scan files, strings.

	@@phone_find_regexp = /\+? ?(\d{0,3} ?(?: ?\d{1}){10})\b/ # Regexp - phone find
	@@data_folder = "#{File.dirname(__FILE__)}/../data"

	def self.find_str(str, regexp = nil)
		# Scan strings. Return array. Always.
		
		result = []
		if regexp
			scanned = str.scan(regexp)
			
			for array in scanned
				result << array[0]
			end
			
		else
			scanned = str.scan(@@phone_find_regexp)
			
			for array in scanned
				result << array[0]
			end

			result.map! { | phone | phone.gsub(/\s+/, "") }	# Remove spaces
		end

		result
	end

	def self.find_file(file_name, data_folder = nil)
		# Scan from file in default folder
		# Example:
		# file_name = "file_name.txt"
		# Where file should be: programms/regexp_tools/phone_find/data/input
		# Complete path = programms/regexp_tools/phone_find/data/input/file_name.txt

		if data_folder
			path_to_file = "#{data_folder}/input/#{file_name}"
		else
			path_to_file = "#{File.dirname(__FILE__)}/../data/input/#{file_name}"
		end
		
		begin
			file = File.new(path_to_file, "r")
		rescue Errno::ENOENT => file_inexist_exc
			return "No such file - #{file_name}"
		end
		
		data = file.readlines

		file.close

		result = []
		for line in data
			scanned = find_str(line)

			for phone in scanned
				result << phone
			end

		end

		result
	end

	def self.write_file(data, file_name, data_folder = nil)
		# Write data to file in default folder

		if data_folder
			path_to_file = "#{data_folder}/output/#{file_name}"
		else
			path_to_file = "#{@@data_folder}/output/#{file_name}"
		end
		
		file = File.new(path_to_file, "w")
		
		for phone in data
			file.write("#{phone} ")
		end

		file.close

	end

end