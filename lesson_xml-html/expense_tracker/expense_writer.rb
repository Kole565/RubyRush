require "rexml/document"
require "date"

require_relative "../../utils/methods.rb"

current_path = File.dirname(__FILE__)
file_name = current_path + "/expenses_auto.xml"

abort "File not founded" unless File.exist?(file_name)

file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)

file.close

puts("What's expense?")
expense_text = get_console_inp(exit_inp = "exit")

puts("How many?")
expense_amount = get_console_inp(exit_inp = "exit")

puts("When? 01.01.2001 for example (dd.mm.yyyy) (space for today)")
expense_date = get_console_inp(exit_inp = " ")

if expense_date == " "
	expense_date = Date.today
else
	expense_date = Date.parse(expense_date)
end

puts("What expense category? (space for 'other')")
expense_category = get_console_inp(exit_inp = " ")

if expense_category == " "
	expense_category = "other"
end

expenses = doc.elements.find("expenses").first

expense = expenses.add_element 'expense', {
	"amount" => expense_amount,
	"category" => expense_category,
	"date" => expense_date.strftime("%d.%m.%Y")
}
expense.text = expense_text

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts("Inforamtion saved")