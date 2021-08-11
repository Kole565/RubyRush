require_relative("lib/bookClass.rb")

harry_potter_book = Book.new(300, 42)

puts("Book about Harry Potter cost: #{harry_potter_book.cost}")
puts("Books about Harry Potter on warehouse: #{harry_potter_book.amount}")

puts("Test complete")