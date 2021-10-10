require "optparse"

require_relative "../../../lib/scripts/get_user_inp.rb"

require_relative "../lib/textparser.rb"
require_relative "../lib/visualizer.rb"

# Get folder data/input file name (need_to_parse.txt for example)

options = {}

OptionParser.new do | opts |

	opts.banner = "Usage parse_file script[options]"

	opts.on("-h", "--help", "Print help") do
		puts opts
		exit
	end

	opts.on("-f", "--file_name FILENAME", "Require FILENAME to open (data/input dir)") do | file_name |
		options[:file_name] = file_name
	end

end.parse!

# data = TextParser.parse_file(options[:file_name])
data = TextParser.parse_file("some.txt")
visual = Visualizer.format(data, "table", {:x_size => 20, :end_sym => "|", :horizontal_split => true})

puts visual