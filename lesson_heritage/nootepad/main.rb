require_relative "../../utils/methods.rb"
require_relative "../../utils/winEncodeFix.rb"

lib_rel_folder = "lib"
require_relative "lib/postClass.rb"
require_relative "lib/memoClass.rb"
require_relative "#{lib_rel_folder}/taskClass.rb"
require_relative "#{lib_rel_folder}/linkClass.rb"

puts("Приветствую! Я блокнот")
puts("Какую запись ты хочешь создать?")

choices = Post.post_types

choices.each_with_index do |type, index|
	puts("\t#{index} - #{type}")
end

inp = -1
while inp < 0 || inp >= choices.size
	inp = get_console_inp().to_i
end

post = Post.create(inp)

post.read_from_console
post.save

puts("Заметка сохранена")