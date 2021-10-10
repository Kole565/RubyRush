require "optparse"

require_relative "../../../utils/methods.rb"
require_relative "../../../utils/winEncodeFix.rb"

lib_relative_folder = "../lib"
require_relative "#{lib_relative_folder}/postClass.rb"
require_relative "#{lib_relative_folder}/memoClass.rb"
require_relative "#{lib_relative_folder}/taskClass.rb"
require_relative "#{lib_relative_folder}/linkClass.rb"

options = {}

OptionParser.new do | option |
	option.banner = "Usage read.rb script"

	option.on("-h", "Print help") do
		puts option
		exit
	end

	option.on("--id POST_ID", "Show info about post by this id") { |o| options[:id] = o }
	option.on("--type POST_TYPE", "What's post types to whow") { |o| options[:type] = o }
	option.on("--limit NUMBER", "Set how many posts should be shown") { |o| options[:limit] = o }

end.parse!

result = Post.find(options[:id], options[:type], options[:limit])

if result.is_a? Post
	puts "Post: #{result.class.name}. ID = #{options[:id]}"

	result.to_strings.each do | line |
		puts line
	end


elsif result.nil?
	

else

	puts "| id\t\t\t| @type\t\t\t| @created_at\t\t\t| @text\t\t\t\t| @url\t\t\t| @overdue_date \t\t\t "

	result.each do | row |
		
		row.each do | field |
			field_text = field.to_s
			
			if field_text.size < 21
				field_text += " " * (19 - field_text.size)
			end
			
			print("| #{field_text.delete("\n\r")[0..19]}\t")
		end

		puts 

	end

end

puts