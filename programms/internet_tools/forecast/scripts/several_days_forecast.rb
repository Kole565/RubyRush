require "optparse"

require_relative "../lib/forecastgetter.rb"
require_relative "../lib/forecastprintmethod.rb"

options = {}

OptionParser.new do | opts |
	opts.banner = "Usage: forecast script"

	opts.on("-h", "--help", "Print help") do
		puts opts
		exit
	end

	opts.on("--link LINK", String, "Weather site xml link") do | link |
		options[:link] = link
	end

	opts.on("--file FILE_NAME", String, "Damp file name (in data/output)") do | file_name |
		options[:file_name] = file_name
	end

	opts.on("--limit FORECASTS_LIMIT", Integer, "How many forecasts show (4 max)") do | limit |
		options[:limit] = limit
	end

end.parse!


if options[:link].nil?
	options[:link] = "https://xml.meteoservice.ru/en/export/gismeteo/point/7914.xml"
end

if options[:limit].nil?
	options[:limit] = 4
elsif options[:limit] > 4 || options[:limit] <= 0 
	options[:limit] = 4
end


page_body = ForecastGetter.get_page_body(options[:link])
forecasts = ForecastGetter.parse(page_body)

if !options[:file_name].nil?
	current_dir = File.dirname(__FILE__)
	path = "#{current_dir}/../data/output/#{options[:file_name]}"

	old_stdout = $stdout

	File.open(path, "w") do | stream |
		$stdout = stream

		print_several_forecasts(forecasts, options)
	end

	$stdout = old_stdout

else

	print_several_forecasts(forecasts, options)

	puts "Press enter to exit..."
	inp = STDIN.gets

end