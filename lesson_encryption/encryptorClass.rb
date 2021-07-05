# Encryption progaramm part
# That's programm shoould ask user string,
# encryption method and return encrypted value (hash)
#
# We contain Encryptor class here

class Encryptor
	
	def initialize()
		require "digest"
		require_relative "../utils/methods.rb"

		# puts("Require's loaded")
	end

	def ask_value()
		@value = get_console_inp()
	end

	def encrypt(value="", mode="md5")
		
		if (value == "") # if user not give string to convert, try use class value
			value = @value
		end

		hash = ""
		case mode.downcase
		when "md5"
			hash = Digest::MD5.hexdigest(value)
		when "sh1"
			hash = Digest::SH1.hexdigest(value)
		end

		return hash
	end

end