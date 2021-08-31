require ("../lesson_class/humanClass.rb")
require ("./filmClass.rb")

sergey = Human.new("Сергей", "Воротников", 15)
madonna = Human.new("Мадонна", "Безбашнева", 45)

jaw = Film.new("Челюсти", "")
diamond_fist = Film.new("Бриллиантовая рука", "Леонид Иович Гайдай")
big_rjaka = Film.new("Big Rjaka", "Hitler")

sergey.set_favorite_film(jaw)
madonna.set_favorite_film(big_rjaka)

puts("#{sergey.who}")
puts("с любимым фильмом: #{sergey.favorite_film.name}")

puts("#{madonna.who}")
puts("с любимым фильмом: #{madonna.favorite_film.name}")