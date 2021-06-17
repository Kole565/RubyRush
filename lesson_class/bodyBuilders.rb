require "./bodyBuilderClass"

first = BodyBuilder.new("First")
second = BodyBuilder.new("Second")
third = BodyBuilder.new("Third")

first.upgradeMuscle(1, 7)
first.upgradeMuscle(2, 5)
first.upgradeMuscle(3, 10)

second.upgradeMuscle(1, 4)
second.upgradeMuscle(2, 10)
second.upgradeMuscle(3, 7)

third.upgradeMuscle(1, 100)
third.upgradeMuscle(2, 100)
third.upgradeMuscle(3, 100)

first.showBody()
second.showBody()
third.showBody()