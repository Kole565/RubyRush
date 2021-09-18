require_relative "../../../utils/winEncodeFix.rb"
require_relative "towns"

require "uri"
require "cgi"
require "net/http"
require "rexml/document"

CLOUDINESS = ["fog", "clear", "small overcast", "overcast", "frown"]
WIND_DIRECTION = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]

def doc_parse(url)	
	# Open internet page and return REXML document
	uri = URI.parse(url) # Create uri

	response = Net::HTTP.get_response(uri)
	
	doc = REXML::Document.new(response.body)
	return doc
end


def get_weather_report(url, date_ind = 0)
	# Date Index: 0 - today, 1 - tomorrow and etc.
	doc = doc_parse(url)

	forecasts = doc.root.elements["REPORT/TOWN"].elements.to_a
	weather_report = {}

	weather_report[:city] = CGI.unescape(doc.root.elements["REPORT/TOWN"].attributes["sname"].encode("utf-8"))
	weather_report[:time] = Time.now + date_ind * 86400

	weather_report[:temperature_max] = forecasts[date_ind].elements["TEMPERATURE"].attributes["max"]
	weather_report[:temperature_min] = forecasts[date_ind].elements["TEMPERATURE"].attributes["min"]

	weather_report[:cloudiness] = CLOUDINESS[forecasts[date_ind].elements["PHENOMENA"].attributes["cloudiness"].to_i]

	weather_report[:wind_max] = forecasts[date_ind].elements["WIND"].attributes["max"]
	weather_report[:wind_min] = forecasts[date_ind].elements["WIND"].attributes["min"]
	weather_report[:wind_direction] = WIND_DIRECTION[forecasts[date_ind].elements["WIND"].attributes["direction"].to_i - 1]

	return weather_report
end

def get_weather_report_by_town(town_name, date_ind) # Towns list hard-coded now
	return get_weather_report(get_towns[town_name], date_ind)
end