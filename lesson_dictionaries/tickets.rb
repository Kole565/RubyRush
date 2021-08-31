def show_ticket(ticket)
	puts("Билет № #{ticket["num"].join(" ")}")
	puts("Маршрут: #{ticket["route"].join(" -> ")}")
	puts("Пассажир: #{ticket["fio"].values.join(" ")}")
	puts("Паспорт: #{ticket["passport_num"].join(" ")}")
end

tickets = []

tickets << {
	"num" => ["РМ", "2010398", "050298"],
	"route" => ["Москва", "Петушки"],
	"fio" => {
		"first_name" => "Венедикт",
		"middle_name" => "Ерофеев",
		"last_name" => "В."
	},
	"passport_num" => [45, 99, 505281]
}

tickets << {
	"num" => ["РМ", "2010399", "050298"],
	"route" => ["Павловский Посад", "Орехово-Зуево"],
	"fio" => {
		"first_name" => "Иннокентий",
		"middle_name" => "Шниперсон",
		"last_name" => "П."
	},
	"passport_num" => [46, 01, 192872]
}

tickets << {
	"num" => ["РМ", "2010399", "050298"],
	"route" => ["Москва", "Владимир"],
	"fio" => {
		"first_name" => "Иван",
		"middle_name" => "Бунша",
		"last_name" => "В."
	},
	"passport_num" => [47, 33, 912876]
}

puts("Пассажиры поезда Москва — Петушки")
puts

for ticket_index in 0..tickets.count - 1
	puts("* * * Место № #{ticket_index + 1} * * *")
	show_ticket(tickets[ticket_index])
	puts
end