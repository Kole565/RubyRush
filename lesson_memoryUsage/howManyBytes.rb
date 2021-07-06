require "objspace"

what_to_count = [
42,
"Василий",
"уйаав",
]

what_to_count_hash = Hash.new

x = 0
for obj in what_to_count
	obj_hash = Hash.new
	obj_hash[0] = obj
	
	puts("Size of #{obj}: #{obj_hash.to_s.bytesize}")
end
