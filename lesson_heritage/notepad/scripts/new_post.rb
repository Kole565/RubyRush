require_relative "../../../utils/methods.rb"
require_relative "../../../utils/winEncodeFix.rb"

lib_relative_folder = "../lib"
require_relative "#{lib_relative_folder}/postClass.rb"
require_relative "#{lib_relative_folder}/memoClass.rb"
require_relative "#{lib_relative_folder}/taskClass.rb"
require_relative "#{lib_relative_folder}/linkClass.rb"

puts("Приветствую! Я блокнот")
puts("Какую запись ты хочешь создать?")

choices = Post.post_types.keys

choices.each_with_index do |type, index|
	puts("\t#{index} - #{type}")
end

inp = -1
while inp < 0 || inp >= choices.size
	inp = get_console_inp().to_i
end

post = Post.create(choices[inp])

post.read_from_console
id = post.save_to_db

puts("Заметка сохранена. Id: #{id}")