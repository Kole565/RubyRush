# In this file user interact with accounts and calculator

require ("./settings.rb")

require ("./inputManagerClass.rb")
require ("./accountClass.rb")
require ("./calculatorClass.rb")

def setup
	globalIOManager = InputManager.new()
	waterCalculator = Calculator.new()
	accounts = []
end

setup()

puts("Programm name and desc")
if (!accounts)
	puts("Accounts list empty. Want to add one?")
	if (globalIOManager.pos_neg_question())
		account = Account.new(account_standarts)
		globalIOManager.ask_standarts(account, account_standarts)
		accounts << account
	else
		puts("OK")
	end
else
	puts("Accounts list: #{accounts.to_s}")
end