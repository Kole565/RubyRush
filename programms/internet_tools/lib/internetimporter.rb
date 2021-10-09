require "uri"
require "net/http"

class InternetImporter
	# Get and format xml from sites
	# Static class

	def self.uri_parse(link)
		# Convert link to URI
		URI.parse link
	end

	def self.get_response(uri)
		# Get response from uri link
		Net::HTTP.get_response uri
	end

end