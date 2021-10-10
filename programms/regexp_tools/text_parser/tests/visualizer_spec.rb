require "rspec"

require_relative "../lib/textparser.rb"
require_relative "../lib/visualizer.rb"

describe "Visualizer" do
	
	it "should return FORMAT_TABLE_x16_TEXT" do

		parser_data = TextParser.parse_str(
			"Some text #first_hashtag call + 7 911 504 30 58
			if you want to tableExample@nail.gem."
		)

		expect(
			Visualizer.format(
				parser_data, "table",
				:x_size => 16, :splitter => "|", :end_sym => "|"
			)
		).to eq "Hashtag         |Phone           |Mail            |
first_hashtag   |79115043058     |tableExample@nai|
"
	end

	it "should return FORMAT_TABLE_x5_CUSTOM_SPLITTERS_TEXT" do

		parser_data = TextParser.parse_str(
			"Some text #first_hashtag call + 7 911 504 30 58
			if you want to tableExample@nail.gem."
		)

		expect(
			Visualizer.format(
				parser_data, "table",
				:x_size => 5, :splitter => "*", :start_sym => "#", :end_sym => "$"
			)
		).to eq "#Hasht*Phone*Mail $
#first*79115*table$
"
	end

	it "should return FORMAT_TABLE_x32_TEXT" do

		parser_data = TextParser.parse_str(
			"Some text #first_hashtag call + 7 911 504 30 58
			if you want to tableExample@nail.gem."
		)

		expect(
			Visualizer.format(
				parser_data, "table",
				:x_size => 32, :splitter => "|", :end_sym => "|"
			)
		).to eq "Hashtag                         |Phone                           |Mail                            |
first_hashtag                   |79115043058                     |tableExample@nail.gem           |
"
	end

end