require "rspec"

require_relative "../../../utils/winEncodeFix.rb"

require_relative "../HashTagFind.rb"

describe "HashTagFind" do
	
	it "should return ONE_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #test_tag string")
		).to eq(["test_tag"])

	end

	it "should return MULTI_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #one #two #three string")
		).to eq(["one", "two", "three"])
		
	end

	it "should return RUSSIAN_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #хороший_программист string")
		).to eq(["хороший_программист"])
		
	end

	it "should return MINUS_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #test-tag string")
		).to eq(["test-tag"])

	end

	it "should return ?_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #test_tag? string")
		).to eq(["test_tag"])

	end

	it "should return !_TAG" do 
		
		expect(
			HashTagFind.string_scan("Testing #test_tag! string")
		).to eq(["test_tag"])

	end

end