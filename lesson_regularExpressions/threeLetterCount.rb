# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

global_path = File.dirname(__FILE__)

file = File.new(global_path + "/data/exampleText.txt", "r:UTF-8")
content = file.read

threeLetterWords = []
threeLetterWords = content.scan(/\b\S{3}\b/)

puts("Слова состоящие из 3-х букв: ")
for word in threeLetterWords
	print("#{word} ")
end
puts
puts("Всего: #{threeLetterWords.count.to_s}")