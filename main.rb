require './parser'

p = Parser.new
worksheet = p.set_file
data = p.set_data(worksheet)
p.sort(data)
p.get_data(data)