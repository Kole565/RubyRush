class Parent

	def initialize(name)
		@name = name
	end

	def name()
		return @name
	end

	def obedient?
		return true
	end
	
end

class Child < Parent

	def obedient?
		return false
	end

end

VI = Parent.new("Василий Игоревич")
M = Child.new("Маша")
K = Child.new("Коля")

puts("#{VI.name} послушный: #{VI.obedient?}")
puts("#{M.name} послушная: #{M.obedient?}")
puts("#{K.name} послушный: #{K.obedient?}")