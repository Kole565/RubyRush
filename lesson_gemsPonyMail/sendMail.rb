# Encoding error fix
if (Gem.win_platform?)
	Encoding.default_external = Encoding.find(Encoding.locale_charmap)
	Encoding.default_internal = __ENCODING__
	
	[STDIN, STDOUT].each do |io|
		io.set_encoding(Encoding.default_external, Encoding.default_internal)
	end
end

global_path = File.dirname(__FILE__)

require "pony"
require "io/console"

require (global_path + "/../utils/methods.rb")

puts("Программа отправки почты с ящика mail")


def get_user_values(my_mail_do = false, subject_do = true, body_do = true, send_to_do = true)
	res = []

	if (my_mail_do)
		puts("Введите вашу mail почту: ")
		my_mail = get_console_inp()
	else
		my_mail = "school_main_mail@mail.ru"
	end

	if (my_mail_do)
		puts("Введите пароль от почты: ")
		password = get_console_inp(hidden = true)
	else
		password = "5zcVwXrdCqkFfh20bhYA"
	end

	if (subject_do)
		puts("Введите тему письма: ")
		subject = get_console_inp()
	else
		subject = "Default subject"
	end

	if (body_do)
		puts("Введите текст письма: ")
		body = get_console_inp()
	else
		body = "Deafault"
	end

	puts("Введите почту получателя: ")
	send_to = get_console_inp()

	res << my_mail
	res << password
	res << subject
	res << body
	res << send_to

	return res
end


def send_mail(from_mail, from_mail_password, subject, body, to_mail)
	Pony.mail({
		:subject => subject,
		:body => body,
		:to => to_mail,
		:from => from_mail,
		:via => :smtp,
		:via_options => {
			:address => 'smtp.mail.ru',
			:port => '465',
			:tls => true,
			:user_name => from_mail,
			:password => from_mail_password,
			:authentication => :plain
		}
	})
end