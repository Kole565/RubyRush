require "rexml/document"

current_path = File.dirname(__FILE__)
file_name = current_path + "/cutaway.xml"

abort "File not founded" unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML::Document.new(file)

# Document created let's create a output str
output = ""
output += "Моя визитка: \n"

doc.root.elements.each("full_name/name_part") do | item |
	res = item.text.gsub /\t/, ''
	res = res.gsub /\n/, '' + " "
	
	output += res
end

output += "\n"
output += doc.root.elements["contacts/phone_nums/num"].text.gsub(/\t/, '').gsub /\n/, ''
output += ", "
output += doc.root.elements["contacts/emails/email"].text.gsub(/\t/, '').gsub /\n/, ''
output += " My skills: \n"

doc.root.elements.each("info/skills/skill") do | item |
	res = item.text.gsub /\t/, ''
	res = res.gsub /\n/, '' + " "
	
	output += res
	output += "\n"
end

file.close

puts(output)