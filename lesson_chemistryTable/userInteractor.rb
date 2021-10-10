require_relative "elementInteractor"
require_relative "../utils/methods.rb"

class UserInteractor
	
	def initialize(elementInteractor="")
		
		if elementInteractor == ""
			@elInter = ElementInteractor.new()
		else
			@elInter = elementInteractor
		end

		puts("Hello!")
		puts("It's a programm - periodic table.")
		puts("Enter the element name in next step.")

		get_element_by_name()

	end

	def elementInteractor
		return @elInter
	end

	def get_inp
		puts("Enter inp ('exit'): ") # It's should be in son's classes..
		inp = get_console_inp(exit_inp="exit")

		return inp
	end

	def get_element_by_name
		el_name = get_inp().capitalize

		if el_name != "all"
			elementInteractor.show_element(el_name)
		else
			elementInteractor.show_all_elements
		end
	end

	def get_all_elements
		elementInteractor.show_all_element()
	end

end