require "json"

data = File.read("cuteaway.json", encoding:"utf-8")
json_data = JSON.parse(data)

for name, value in json_data
	
	case name
	when "contacts"
		
		for contact in value
			
			if value.find_index(contact) != value.size - 1 # Not last
				print("#{contact}, ")
			else
				print("#{contact}")
			end

		end

		puts
	else
		puts("#{value}")
	end

end