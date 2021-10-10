require_relative "../../phone_find/lib/phonefinder.rb"

class MailFinder < PhoneFinder
	# Static class. Scan files, strings.
	# Derive from PhoneFinder

	@@mail_find_regexp = /([\w-]*@{1}[\w-]*.[\w-]*)/ # Regexp - mail find

	def self.find_str(str)
		# Scan strings. Return array. Always.
		result = super(str, @@mail_find_regexp)

		# result.map! { | phone | phone.gsub(/\s+/, "") }	# Remove spaces

		result # Auto return
	end

	def self.find_file(file_name)
		# Use PhoneFinder behaviour

		result = super(file_name, "#{File.dirname(__FILE__)}/../data")

		result
	end

	def self.write_file(data, file_name)
		# Write data to file in default folder

		super(data, file_name, @@data_folder)

	end

end