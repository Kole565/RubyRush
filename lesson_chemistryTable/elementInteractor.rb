require "json"

class ElementInteractor

	def initialize(path="data/table.json")
		@json_data = get_json(path)

		test
	end

	def json_data
		return @json_data
	end

	def get_json(path)
		file = File.read(path, encoding:"utf-8")
		json_data = JSON.parse(file)
		
		return json_data
	end
	
	def show_all_elements()

		for key in json_data.keys
			show_element(key)
		end

		# for short_name, element in json_data
		# 	puts("#{short_name} - #{element["name"].capitalize}")
		# end

	end
	
	def show_element(name)
		
		puts("\n#{name} - #{json_data[name]["name"].capitalize}")
		for key, value in json_data[name]
			puts("#{key.capitalize}: #{value}")
		end		
		# for key, value in json_data[name]
		# 	for fields
		# end

	end

	def test
		isActive = false

		if isActive
			
			puts("Hydrogen test: ")
			show_element("H")

			puts("\nAll elements test: ")
			show_all_elements()

		end

	end

end

