require "rspec"

require_relative "./sklonatorClass.rb"

describe "Sklonator" do

	it "should do OK sklonenie WITH_0_END" do

		expect(
			Sklonator.sklonit(10, ["krocodil", "krocodila", "krocodilov"])
		).to eq("10 krocodilov")
		
	end

	it "should do OK sklonenie WITH_0_END_AUTOMATED" do
		
		(0..1000).step(10) do |num|
			expect(
				Sklonator.sklonit(num, ["krocodil", "krocodila", "krocodilov"], "str")
			).to eq("#{num} krocodilov")
		end

	end

	it "should do OK sklonenie WITH_1_END_AUTOMATED" do
		
		(0..1000).step(10) do |num|
			
			if num && 100 == 10
				expect(
					Sklonator.sklonit(num + 1, ["krocodil", "krocodila", "krocodilov"], "str")
				).to eq("#{num + 1} krocodil")
			end

		end

	end

	it "should do OK sklonenie WITH_2_4_END_AUTOMATED" do
		
		[2, 3, 4].each do |end_num|

			(0..1000).step(10) do |num|
				
				if (num && 100).between?(12, 14)
					expect(
						Sklonator.sklonit(num + end_num, ["krocodil", "krocodila", "krocodilov"], "str")
					).to eq("#{num + end_num} krocodila")
				end

			end

		end

	end

	it "should do OK sklonenie WITH_5_9_END_AUTOMATED" do
		
		[5, 6, 7, 8, 9].each do |end_num|
			
			(0..1000).step(10) do |num|
				expect(
					Sklonator.sklonit(num + end_num, ["krocodil", "krocodila", "krocodilov"], "str")
				).to eq("#{num + end_num} krocodilov")
			end

		end

	end

	it "should do OK sklonenie WITH_EXSEPTION_END_AUTOMATED" do
		
		[11, 12, 13, 14].each do |end_num|
			
			(0..1000).step(100) do |num|
				expect(
					Sklonator.sklonit(num + end_num, ["krocodil", "krocodila", "krocodilov"], "str")
				).to eq("#{num + end_num} krocodilov")
			end

		end

	end

end