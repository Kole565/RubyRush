# It's file with class Parser.
# Parser should be can:
# 	Open site's by url
#	Get info (prices, names, etc. by folowing methods)
# 	Return info in Item class example

global_path = File.dirname(__FILE__)

require "net/http"
require global_path + "/itemClass.rb"

class Parser

	def initialize()
		connect_to_site("https://www.dns-shop.ru/catalog/17a8932c16404e77/sistemnye-bloki/")
		puts("Parser created")

		@content = get_content()
		get_names(@content)

		
	end

	def connect_to_site(url)
		@uri = URI(url)
		puts("Site connection complete")
	end

	def get_content()
		content = Net::HTTP.get(
			URI(@uri)
		).force_encoding('UTF-8')

		return content
	end

	def get_names(content)
		# /<span>.*?<\/span>/
		if (content)
			names = content.scan(/<span>.*?<\/span>/)
			puts("Content have")
		end
		puts("Names: #{names.to_s}")
		return
	end

end