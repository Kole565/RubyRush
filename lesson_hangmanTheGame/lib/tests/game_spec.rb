require "rspec"

require_relative "../../gameClass.rb"
require_relative "../../resultPrinterClass.rb"

describe "Game" do

	it "should GET_VALUES" do
		test_game_class = Game.new("testing")
		
		expect(
			test_game_class.get_value("letters")
		).to eq("testing".split(""))
	end

	it "should WIN" do
		test_game_class = Game.new("testing")
		test_printer_class = ResultPrinter.new(test_game_class)
		
		"testing".split("").each do | letter |
			test_game_class.next_step(letter)
		end

		expect(
			test_game_class.get_value("errors")
		).to eq(0)

		expect(
			test_game_class.get_value("status")
		).to eq(1)

		expect(
			test_printer_class.print_status(test_game_class, true)
		).to eq("You win!")

	end

	it "should LOSE" do
		test_game_class = Game.new("testing")
		test_printer_class = ResultPrinter.new(test_game_class)

		"qwryuop".split("").each do | letter |
			test_game_class.next_step(letter)
		end

		expect(
			test_game_class.get_value("errors")
		).to eq(7)

		expect(
			test_game_class.get_value("status")
		).to eq(-1)

		expect(
			test_printer_class.print_status(test_game_class, true)
		).to eq("You lose!")
		
	end

end