def get_component(folder_path, path)
	
	if (File.exist?(folder_path + path))
		return File.new(folder_path + path, "r:UTF-8").readlines.sample
	else
		return
	end

end

def check_component(component, default)

	if (component)
		return component
	else
		return default
	end

end

def createFace(file_path)
	global_path = File.dirname(__FILE__)
	folder_path = global_path + "/data/face"
	
	face = []

	forehead = get_component(folder_path, "/forehead.txt")
	eyes = get_component(folder_path, "/eyes.txt")
	nose = get_component(folder_path, "/nose.txt")
	mouth = get_component(folder_path, "/mouth.txt")

	face << check_component(forehead, "/ --- \\")
	face << check_component(eyes, "| O O |")
	face << check_component(nose, "\ v /")
	face << check_component(mouth, "\ - /")

	return face
end