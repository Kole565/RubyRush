# It's a test file
# His func => get 3 items from items list and show it to user.

global_path = File.dirname(__FILE__)

require global_path + "/parserClass.rb" # We don't need Item class. Item class will be imported in parserClass file

parser = Parser.new()