class Calculator

	def initialize(man_weight_const = 0.04, man_activity_const = 0.6, woman_weight_const = 0.03, woman_activity_const = 0.4)
		@man_weight_const = man_weight_const
		@man_activity_const = man_activity_const

		@woman_weight_const = man_weight_const
		@woman_activity_const = man_activity_const
	end

	def calc_water_amount(gender = "average", weight, activity_time) # Return float, in litres
		res = 0
		case gender
		when "man"
			res = ((weight * @man_weight_const) + (activity_time * @man_activity_const))
		when "woman"
			res = ((weight * @woman_weight_const) + (activity_time * @woman_activity_const))
		when "average"
			res = ((weight * ((@man_weight_const + @woman_weight_const) / 2)) + (activity_time * ((@man_activity_const + @woman_activity_const) / 2)))
		else
			return
		end

		return res
	end

end