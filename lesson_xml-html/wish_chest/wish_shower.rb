require "rexml/document"
require "date"

current_path = File.dirname(__FILE__)
file_name = current_path + "/data/wishes.xml"

abort "File not founded" unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML::Document.new(file)

all_wishes = doc.root.elements

file.close

completed_wishes, uncompleted_wishes = [], []

for wish in all_wishes
	if Date.parse(wish.attributes.get_attribute("date").value) < Date.today
		completed_wishes << wish
	else
		uncompleted_wishes << wish
	end
end

print("Completed: \n")
for wish in completed_wishes
	print("#{wish.attributes.get_attribute("date").value.strip}: #{wish.text.strip}")
end
puts

print("Uncompleted: \n")
for wish in uncompleted_wishes
	print("#{wish.attributes.get_attribute("date").value.strip}: #{wish.text.strip}\n")
end

