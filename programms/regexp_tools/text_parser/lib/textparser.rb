require_relative "../../hashtag_find/lib/hashtagfinder.rb"
require_relative "../../mail_find/lib/mailfinder.rb"
require_relative "../../phone_find/lib/phonefinder.rb"

class TextParser
	# Parse text for hashtags, phones and mails
	# Static class
	@@data_folder = "regexp_tools/text_parser/data"


	def self.parse_str(str)
		parsed = {}

		# Parsing in other classes
		hashtags = HashtagFinder.find_in_str(str)
		phones = PhoneFinder.find_str(str)
		mails = MailFinder.find_str(str)

		# Hash collecting
		parsed[:hashtag] = hashtags
		parsed[:phone] = phones
		parsed[:mail] = mails

		return parsed
	end

	def self.parse_file(file_name)
		# Open and parse file
		
		current_dir = File.dirname(__FILE__)
		path = "#{current_dir}/../data/input/#{file_name}"

		file = File.new(path, "r")

		lines = file.readlines

		file.close

		parsed = {}

		hashtags = []
		phones = []
		mails = []

		# Parsing in other classes
		for line in lines
			hashtags += HashtagFinder.find_in_str(line)

			phones += PhoneFinder.find_str(line)
			
			mails += MailFinder.find_str(line)
		end

		# Hash collecting
		parsed[:hashtag] = hashtags
		parsed[:phone] = phones
		parsed[:mail] = mails

		return parsed
	end
	

end