global_path = File.dirname(__FILE__)

require(global_path + "/../lesson_fileReading/faceCreatorMethods.rb")

file_name = "face-#{Time.now.strftime("%Y_%m_%d--%H_%M")}.txt"
face = createFace("#{global_path}/data/faces/#{file_name}.txt")

file = File.new(global_path + "/data/faces/" + file_name, "a:UTF-8")
for line in face
	file.puts(line)
end

file.close

puts("Лицо в файле #{file_name} успешно создано и сохранено.")