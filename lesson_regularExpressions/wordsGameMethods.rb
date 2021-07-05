require "net/http"

def get_reg_expr()
	patterns = ["тофу", "руби", "сам", "перк"]
	pattern = patterns.sample

	rand_letter = pattern.split("").sample
	pattern = pattern.gsub(rand_letter, ".")

	return pattern
end

def word_exist?(word, language = "ru")
	case language
	when "ru"
		uri = "https://ru.wiktionary.org/wiki/" + URI.encode_www_form_component(word)
		error_empty_text = "В настоящий момент текст на данной странице отсутствует."
	when "en"
		uri = "https://en.wiktionary.org/wiki/" + URI.encode_www_form_component(word)
		error_empty_text = "Wiktionary does not yet have an entry for"
	end

	wiktionary_page = Net::HTTP.get(
		URI(uri)
	).force_encoding('UTF-8')

	if (wiktionary_page =~ /#{error_empty_text}/)
		return false
	else
		return true
	end
	
end