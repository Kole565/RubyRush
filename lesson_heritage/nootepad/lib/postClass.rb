class Post

	def initialize()
		@text = []
		@creation_time = Time.now
		@author = nil
	end

	def self.post_types
		return [Memo, Task, Link]
	end

	def self.create(index)
		return post_types[index].new
	end

	def read_from_console()
		# Abstract
	end

	def to_strings()
		# Abstract
	end

	def save()
		file = File.new(file_path, "w:UTF-8")

		for text_to_write in to_strings
			file.puts(text_to_write)
		end

		file.close
	end

	def file_path
		current_path = File.dirname("__FILE__")
		
		file_name = @creation_time.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

		return "#{current_path}/#{file_name}"
	end

end