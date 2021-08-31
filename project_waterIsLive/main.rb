# In this file user interact with accounts and calculator

require ("./settings.rb")

require ("./inputManagerClass.rb")
require ("./accountClass.rb")
require ("./calculatorClass.rb")

globalIOManager = InputManager.new()
mainCalculator = Calculator.new()
accounts_list = []

base_account = Account.new(["name", "gender", "age", "weight"])
globalIOManager.ask_standarts(base_account)
accounts_list << base_account

puts("Setup Complete")

puts("Хотите узнать необходимое вам колличество воды в день?")

if (globalIOManager.pos_neg_question() == true)
	puts("Какова ваша дневная активность?")
	
	activity_time = globalIOManager.float_question()
	res = mainCalculator.calc_water_amount(accounts_list[0].get_value("gender"), accounts_list[0].get_value("weight").to_f, activity_time.to_f)

	puts("Вам необходио #{res} л. воды в день.")
else
	puts("Хорошо. Функционала больше нет. Программа будет закрыта.")
	abort
end