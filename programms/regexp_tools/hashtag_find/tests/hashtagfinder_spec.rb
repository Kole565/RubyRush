require "rspec"

require_relative "../lib/hashtagfinder.rb"

describe "HashtagFinder" do
	
	it "should return SINGLE_TAG" do
		
		expect(
			HashtagFinder.find_in_str("Testing #test_tag string")
		).to eq(["test_tag"])

	end

	it "should return SINGLE_POST_WORD_TAG" do
		
		expect(
			HashtagFinder.find_in_str("Testing#test_tag string")
		).to eq(["test_tag"])

	end

	it "should return MULTI_TAG" do 
		
		expect(
			HashtagFinder.find_in_str("Testing #one #two #three string")
		).to eq(["one", "two", "three"])
		
	end

	it "should return RUSSIAN_TAG" do 
		
		expect(
			HashtagFinder.find_in_str("Testing #хороший_программист string")
		).to eq(["хороший_программист"])
		
	end

	it "should return MINUS_TAG" do 
		
		expect(
			HashtagFinder.find_in_str("Testing #test-tag string")
		).to eq(["test-tag"])

	end

	it "should return ?_TAG" do 
		
		expect(
			HashtagFinder.find_in_str("Testing #test_tag? string")
		).to eq(["test_tag"])

	end

	it "should return !_TAG" do 
		
		expect(
			HashtagFinder.find_in_str("Testing #test_tag! string")
		).to eq(["test_tag"])

	end

	it "should return SINGLE_TAG_FROM_FILE" do 
		
		expect(
			HashtagFinder.from_file("one_tag.txt")
		).to eq(["hashtag"])

	end

	it "should return MULTI_TAG_FROM_FILE" do 
		
		expect(
			HashtagFinder.from_file("multi_tag.txt")
		).to eq(["tags", "MOORE", "Ruby"])

	end

	it "should return FILE_NOT_FOUND_ERROR" do 
		
		expect(
			HashtagFinder.from_file("no_this_file.txt")
		).to eq("File no_this_file.txt not found")

	end

	it "should write SINGLE_TAG_TO_FILE" do 
		HashtagFinder.from_file("one_tag.txt", "one_tag.txt")
		
		expect(
			HashtagFinder.from_file("../give_hashtag/one_tag.txt")
		).to eq(["hashtag"])

	end

	it "should write MULTI_TAG_TO_FILE" do 
		HashtagFinder.from_file("multi_tag.txt", "multi_tag.txt")
		
		expect(
			HashtagFinder.from_file("../give_hashtag/multi_tag.txt")
		).to eq(["tags", "MOORE", "Ruby"])

	end

 
end