# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

current_path = File.dirname(__FILE__)

if (File.exist?(current_path + "/data/quiz/questions.txt"))
	questions_file = File.new(current_path + "/data/quiz/questions.txt", "r:UTF-8")
	questions = questions_file.readlines

	questions_file.close
end

if (File.exist?(current_path + "/data/quiz/answers.txt"))
	answers_file = File.new(current_path + "/data/quiz/answers.txt", "r:UTF-8")
	answers = answers_file.readlines

	answers_file.close
end

puts("Мини-викторина. Ответьте на вопросы.")
right_answ = 0
index = 0
while index < questions.count
	puts("#{(index + 1).to_s}. #{questions[index]}")

	inp = ""
	while (inp == "" || inp == nil)
		inp = STDIN.gets.encode("UTF-8").chomp.downcase
	end

	if (inp == answers[index].chomp)
		right_answ += 1

		puts("Правильный ответ!")
		puts
	else
		puts("Вы ошиблись. Правильным был ответ: #{answers[index]}")
		puts
	end

	index += 1
end

puts("У вас #{right_answ.to_s} правильных ответов из #{questions.count.to_s}")
if (right_answ == questions.count)
	puts("Всё верно!")
end