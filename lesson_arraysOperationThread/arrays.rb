family = ["I", "Mom"]

puts(family.to_s)

family.push("Grand Mother", "Grand Father")

puts(family.to_s)

family << "Dad"

puts(family.to_s)

family.delete("Grand Mother")

puts(family.to_s)

family.delete_at(0)

puts(family.to_s)