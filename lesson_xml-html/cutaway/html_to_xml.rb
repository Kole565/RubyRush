require "rexml/document"
require "date"

def add_field(field_name, field_value, tag)
	field = tag.add_element field_name
	field.text = field_value
end

current_dir = File.dirname(__FILE__)
file_name = current_dir + "/data/cuteawayConverted.xml"

file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

# Search root container
cuteawayContainer = doc.root.elements.first

# Adding fields by method
add_field("name", "Stepanov Nikolay", cuteawayContainer)
add_field("skill", "Can read and write simple code on Ruby", cuteawayContainer)
add_field("phone", "+ 7 900 912 60 87", cuteawayContainer)
add_field("email", "rjkz565rjkz565@gmail.com", cuteawayContainer)
add_field("photo", "https://sun9-41.userapi.com/impf/c850132/v850132159/138d1/JZ-m41erTok.jpg?size=778x1080&quality=96&sign=7952c08d25b2993a761c702273712734&type=album", cuteawayContainer)

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close