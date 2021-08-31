require_relative "encryptorClass.rb"
require_relative "../utils/winEncodeFix.rb"

encryptor = Encryptor.new()

puts("Введите слово или фразу для шифрования: ")
usr_str = get_console_inp()

puts("Каким способом зашифровать: ")
puts("1. MD5")
puts("2. SH1")
code_meth = get_console_inp()

case code_meth.downcase
when "1" || "md5"
	hash = encryptor.encrypt(usr_str, mode="md5")
when "2" || "sha1"
	hash = encryptor.encrypt(usr_str, mode="sha1")
end

puts("Вот что получилось: ")
puts(hash)