# Version 2

require "rexml/document"
require_relative "../utils/winEncodeFix.rb"

current_path = File.dirname(__FILE__)
file_name = current_path + "/cutaway.xml"

abort "File not founded" unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML::Document.new(file)
file.close

card = {}

["full_name/first_name", "full_name/last_name", "full_name/middle_name",
"contacts/phone_nums/main", "contacts/emails/main", "info/skills/ruby"
].each do | field |
	card[field] = doc.root.elements[field].text
end

cutaway = ""
cutaway += "#{card["full_name/first_name"].strip}, #{card["full_name/last_name"].strip}, #{card["full_name/middle_name"].strip}\n"
cutaway += "#{card["contacts/phone_nums/main"].strip}, #{card["contacts/emails/main"].strip}\n"
cutaway += "#{card["info/skills/ruby"].strip}"

puts(cutaway)