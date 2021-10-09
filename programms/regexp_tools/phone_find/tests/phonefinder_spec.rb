require "rspec"

require_relative "../lib/phonefinder.rb"

describe "PhoneFinder" do
	# Tests for class

	# For str arg
	it "should return ONE_STR_+_7_PHONE" do
		
		expect(
			PhoneFinder.find_str("There a example number + 7 923 546 09 84 with + 7 on start")
		).to eq(["79235460984"])

	end

	it "should return ONE_STR_+_8_PHONE" do
		
		expect(
			PhoneFinder.find_str("There a example number + 8 923 487 09 84 with + 8 on start")
		).to eq(["89234870984"])

	end

	it "should return ONE_STR_PHONE" do
		
		expect(
			PhoneFinder.find_str("There a example number + 923 546 09 84 without anything on start")
		).to eq(["9235460984"])

	end

	it "should return ONE_STR_PHONE_WITHOUT_SPACE_+" do
		
		expect(
			PhoneFinder.find_str("There a example number 9235460984 without anything on start")
		).to eq(["9235460984"])

	end

	it "should return MULTI_STR_PHONE" do
		
		expect(
			PhoneFinder.find_str("There a several num's: + 7 923 546 09 84, 902 859 90 33, 444 444 4004")
		).to eq(["79235460984", "9028599033", "4444444004"])

	end

	# From files
	it "should return ONE_STR_+_7_PHONE_FILE" do
		
		expect(
			PhoneFinder.find_file "one_phone.txt"
		).to eq(["79235460984"])

	end

	it "should return ONE_STR_PHONE_WITHOUT_SPACE_+_FILE" do
		
		expect(
			PhoneFinder.find_file("one_phone_without_space.txt")
		).to eq(["9235460984"])

	end

	it "should return MULTI_STR_PHONE" do
		
		expect(
			PhoneFinder.find_file("multi_phone.txt")
		).to eq(["79235460984", "9028599033", "4444444004"])

	end

	it "should return FILE_ABSENCE_EXCEPTION" do
		
		expect(
			PhoneFinder.find_file("no_file.txt")
		).to eq("No such file - no_file.txt")

	end

	# To files
	it "should write MULTI_STR_PHONE_TO_FILE" do
		
		data = PhoneFinder.find_file("multi_phone.txt")
		PhoneFinder.write_file(data, "multi_phone.txt")

		expect(
			PhoneFinder.find_file("../output/multi_phone.txt")
		).to eq(["79235460984", "9028599033", "4444444004"])

	end

end