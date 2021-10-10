require_relative "../../utils/winEncodeFix.rb"

class HashTagFind
	
	def self.string_scan(str)
		tags, result = nil, []

		tags = str.scan /\#{1}(?:[a-zA-Zа-яА-Я]*[^!?\[ \]#])*/ if str
		new_tags = []
		for tag in tags
			result << tag[1..]
		end

		return result
	end

end