require "rspec"

require_relative "../lib/forecastgetter.rb"

describe "ForecastGetter" do
	
	it "should GET_PAGE_BODY" do
		
		page_str = ForecastGetter.get_page_body("https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml")

		expect(page_str.class.name).to eq("String")
		expect(page_str.lines.count).to be > 10
		
	end

	it "should PARSE_PAGE_BODY" do
		
		page_str = ForecastGetter.get_page_body("https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml")
		parsed = ForecastGetter.parse(page_str)
		
		expect(
			parsed.count
		).to eq(4) # Four forecasts
		
	end

end