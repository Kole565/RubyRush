require "sqlite3"

class Post

	@@db_path = "../data/notepad.sqlite"

	def initialize()
		@text = []
		@creation_time = Time.now
		@author = nil
	end

	def text
		@text
	end

	def self.post_types
		{"Memo" => Memo, "Task" => Task, "Link" => Link}
	end

	def self.create(type)
		post_types[type].new
	end

	def self.find(id, type, limit)
		
		begin
			db = SQLite3::Database.open(@@db_path)
		rescue => exception
			raise "Database open error"
		else
				
			if !id.nil?
				return find_by_id(db, id)
			else
				return find_all(db, type, limit)
			end

		end

	end

	def self.find_by_id(db, id)
		begin
			db.results_as_hash = true

			result = db.execute("SELECT * FROM posts WHERE rowid = ?", id)
						
			db.close

			if result.empty?
				puts("This ID not in the database")
				
				return nil
			else
				result = result[0]
				
				post = create(result["type"])

				post.load_data(result)

				return post
			end

		rescue SQLite3::SQLException => exception
			puts "Table #{exception.message.split(" ")[-1]} not found"
		end

	end

	def self.find_all(db, type, limit)
		begin
			db.results_as_hash = false

			query = "SELECT rowid, * FROM posts "
			query += "WHERE type = :type " unless type.nil?
			query += "ORDER by rowid DESC "
			query += 'LIMIT :limit ' unless limit.nil?

			statement = db.prepare query

			statement.bind_param('type', type) unless type.nil?
			statement.bind_param('limit', limit) unless limit.nil?

			result = statement.execute!

			statement.close
			db.close

			return result

		rescue SQLite3::SQLException => exception
			puts "Table #{exception.message.split(" ")[-1]} not found"
		end
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

	def save_to_db

		db = SQLite3::Database.open(@@db_path)
		db.results_as_hash = true
		
		db.execute(
			"INSERT INTO posts " +
			"(#{to_db_hash.keys.join(",")}) " +
			"VALUES (#{("?," * to_db_hash.keys.size).chomp(",")})",
			to_db_hash.values
		)
		insert_row_id = db.last_insert_row_id
		db.close

		return insert_row_id
	end

	def to_db_hash
		
		return {
			"type": self.class.name,
			"create_date": @creation_time.to_s
		}

	end

	def load_data(data_hash)
		@created_at = Time.parse(data_hash["create_date"])
	end

end