# Search hashtags and return it

class HashtagFinder
	@@hashtag_find_regexp = /\#(?:[^!?\s\[\]\,])*/

	def self.find_in_str(str)
		hashtags = []

		str.scan(@@hashtag_find_regexp).each do | hashtag |
			hashtags << hashtag[1..]
		end
		
		return hashtags
	end

	def self.from_file(in_file_name, out_file_name = nil)
		# All files lay in 'data' folder
		# file_name not path(example.txt)
		# out_file_name - output file name
		
		hashtags = []

		path = "E:/Documents_Large/NeedMoreCode/RubyRush/programms/regexp_tools/hashtag_find/data/get_hashtag/#{in_file_name}"
		
		return "File #{in_file_name} not found" unless File.exist? path

		file = File.new path, "r:UTF-8"

		file.readlines.each do | line |
			
			line = find_in_str line
			
			line.each do | tag | # If in line more than one tag
				hashtags << tag
			end

		end

		file.close

		if out_file_name
			current_dir = File.dirname(__FILE__)
			out_path = "#{current_dir}/../data/give_hashtag/#{out_file_name}"

			out_file = File.new out_path, "w"
			
			for hashtag in hashtags
				out_file.write "##{hashtag} " # Two '#' - not error
			end

			out_file.close
		end

		return hashtags
	end
	
end