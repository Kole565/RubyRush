require "rspec"

require_relative "../scripts/get_hashtags_from_file.rb"

describe "get_hashtags_from_file" do
	

	it "should return SCRIPT_SINGLE_TAG_FROM_FILE" do
		
		expect(
			get_hashtags_from_file "one_tag.txt"
		).to eq(["hashtag"])

	end

	it "should return SCRIPT_MULTI_TAG_FROM_FILE" do
		
		expect(
			get_hashtags_from_file "multi_tag.txt"
		).to eq(["tags", "MOORE", "Ruby"])

	end

 
end