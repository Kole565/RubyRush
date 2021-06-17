class BodyBuilder

	def initialize(name)
		@name = name
		
		@hands = 0
		@press = 0
		@legs = 0
		
		@muscles = [
			@hands,
			@press,
			@legs
		]
	end

	def upgradeMuscle(num, power)
		@muscles[num - 1] += power
	end

	def showBody()
		puts("Характеристики бодибилдера #{@name}: ")

		for muscle in @muscles
			puts("#{muscle}")
		end

		puts
	end
end