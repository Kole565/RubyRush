require "rspec"

require_relative "../lib/table.rb"

describe "Table" do
	
	it "should print EMPTY_3_3_TABLE" do

		table = Table.new(3, 3)

		expect(
			table.header
		).to eq([nil, nil, nil])

		expect(
			table.data
		).to eq(
			[
				[nil, nil, nil],
				[nil, nil, nil]
			]
		)

		expect(
			table.data[0]
		).to eq([nil, nil, nil])

		expect(
			table.row(0)
		).to eq([nil, nil, nil])

		expect(
			table.data.size == 2
		).to eq(true)

	end

	it "should print EMPTY_5_2_LONG_TABLE" do

		table = Table.new(5, 2)

		expect(
			table.header
		).to eq([nil, nil, nil, nil, nil])

		expect(
			table.data
		).to eq(
			[
				[nil, nil, nil, nil, nil]
			]
		)

		expect(
			table.data[0]
		).to eq([nil, nil, nil, nil, nil])

		expect(
			table.data.size == 1
		).to eq(true)

	end

	it "should print EMPTY_5_10_LARGE_TABLE" do

		table = Table.new(5, 10)

		expect(
			table.header
		).to eq([nil, nil, nil, nil, nil])

		expect(
			table.data
		).to eq(
			[
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil],
				[nil, nil, nil, nil, nil]
			]
		)

		expect(
			table.data[0]
		).to eq([nil, nil, nil, nil, nil])

		expect(
			table.data.size == 9
		).to eq(true)

	end

	it "should print 3_3_TABLE_VALUE" do

		table = Table.new(3, 3)
		table.set_element(2, 1, "value")

		expect(
			table.header
		).to eq([nil, nil, nil])

		expect(
			table.data
		).to eq(
			[
				[nil, "value", nil],
				[nil, nil, nil]
			]
		)

		table.set_element(1, 2, "valueNext")

		expect(
			table.data
		).to eq(
			[
				[nil, "value", nil],
				["valueNext", nil, nil]
			]
		)

	end

	it "should print 3_3_TABLE_VALUE_HEADER" do

		table = Table.new(3, 3)

		table.set_header(["First Name", "Last Name", "Phone"])

		expect(
			table.header
		).to eq(["First Name", "Last Name", "Phone"])

		expect(
			table.data
		).to eq(
			[
				[nil, nil, nil],
				[nil, nil, nil]
			]
		)

	end


end