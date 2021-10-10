class Sklonator

	def self.sklonit(num, forms, output_type = "str")
		num_last_symbol = num.to_s.split("")[-1]

		if num < 0
			return nil
		end

		if num > 10 &&	(num.to_s.split("")[-2..].join("").to_i).between?(11, 14)
			right_ind = 2
		else
			
			if num_last_symbol == "1"
				right_ind = 0
			elsif num_last_symbol.to_i.between?(2, 4)
				right_ind = 1
			else # Num is 4, 5, 6, 7, 8, 9 or 0
				right_ind = 2
			end

		end

		case output_type
		when "str"
			return "#{num} #{forms[right_ind]}"
		when "form"
			return forms[right_ind]
		when "hash"
			return {num: forms[right_ind]}
		else
			raise "Output type error in Sklonator class"
		end
		
	end

end