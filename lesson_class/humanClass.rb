class Human

	def initialize(first_name, last_name, age)
		@first_name = first_name.downcase
		@last_name = last_name.downcase
		@age = age
	end

	def set_favorite_film(film_obj)
		@film = film_obj
	end

	def favorite_film()
		
		if (@film)
			return @film
		end

	end

	def who()

		if (@age >= 60)
			res = "#{@first_name.capitalize} #{@last_name.capitalize}"
		else 
			res = "#{@first_name.capitalize}"
		end

		return res
	end

	def how_old()
		
		if (@age >= 60)
			puts("И ему #{@age} — пожилой")
		else
			puts("И ему #{@age} — молодой")
		end
		
	end
end