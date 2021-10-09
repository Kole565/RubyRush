require "rspec"

require_relative "../lib/textparser.rb"

describe "TextParser" do
	
	it "should return FORMATED_TEXT_HASH_STR" do

		compare_hash = {}
		
		# Hash format:
		# type of find (in single form) => array with matchs in text
		compare_hash[:hashtag] = ["first_hashtag"]
		compare_hash[:phone] = ["79115043058"]
		compare_hash[:mail] = ["tableExample@nail.gem"]

		expect(
			TextParser.parse_str(
				"Some text #first_hashtag call + 7 911 504 30 58
				if you want to tableExample@nail.gem."
			)
		).to eq(compare_hash)
	end

	it "should return FORMATED_TEXT_HASH_FROM_FILE" do
		compare_hash = {}
		
		compare_hash[:hashtag] = ["first_hashtag"]
		compare_hash[:phone] = ["79115043058"]
		compare_hash[:mail] = ["tableExample@nail.gem"]

		expect(
			TextParser.parse_file "need_to_parse.txt"
		).to eq(compare_hash)
	end


end