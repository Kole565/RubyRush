require_relative "../lib/hashtagfinder.rb"

def get_hashtags_from_file(file_name = nil)

	if file_name == nil
		file_name = ARGV[0]
	end
	
	return HashtagFinder.from_file(file_name)

end