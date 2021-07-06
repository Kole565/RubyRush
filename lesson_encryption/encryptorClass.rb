# Encryption progaramm part
# That's programm shoould ask user string,
# encryption method and return encrypted value (hash)
#
# We contain Encryptor class here

require "digest"
require_relative "../utils/methods.rb"
require_relative "../utils/winEncodeFix.rb"

class Encryptor
	
	def initialize()
		# puts("Require's loaded")
	end

	def encrypt(str_to_convert="", mode="md5")

		hash = ""
		case mode.downcase
		when "md5"
			hash = Digest::MD5.hexdigest(str_to_convert)
		when "sha1"
			hash = Digest::SHA1.hexdigest(str_to_convert)
		end
		puts("Hash: #{hash}")
		puts("Value: #{str_to_convert}")
		
		return hash
	end

end