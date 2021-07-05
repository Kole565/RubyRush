require_relative "encryptorClass.rb"

encryptor = Encryptor.new()

puts("Введите слово или фразу для шифрования: ")
encryptor.ask_value()

puts("Каким способом зашифровать: ")
puts("1. MD5")
puts("2. SH1")

choice = get_console_inp()

case choice.downcase
when "1" || "md5"
	hash = encryptor.encrypt(mode="md5")
when "2" || "sh1"
	hash = encryptor.encrypt(mode="sh1")
end

puts("Вот что получилось: ")
puts(hash)