require_relative "../../utils/winEncodeFix.rb"

require "uri"
require "cgi"
require "net/http"
require "rexml/document"

uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")

response = Net::HTTP.get_response(uri)
doc = REXML::Document.new(response.body)

currency_list = {}
for valute in doc.root.elements.each(){"//Valute"}
	currency_list[valute.elements["NumCode"].text] = [
		valute.elements["Name"].text,
		valute.elements["Value"].text,
		valute.elements["CharCode"].text,
	]
end

# for id, value in currency_list
# 	puts "#{value[0]}: #{value[1]} #{value[2]}."
# end

for valute in ["978", "840"]
	
	name, val, code = currency_list[valute]
	puts "#{name}: #{val} #{code}."

end