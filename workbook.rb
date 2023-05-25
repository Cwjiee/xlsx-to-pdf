require 'rubyXL'
require 'rubyXL/convenience_methods'

# print 'file name : '
# name = gets.chomp
# workbook = RubyXL::Parser.parse("../#{name}.xlsx")
workbook = RubyXL::Parser.parse('../workbook1.xlsx')

worksheet = workbook[0]
arr = []
data = { name: "nope", price: 0.00, quantity: 0}

worksheet.each_with_index do |row, i|
	if i!= 0
		row && row.cells.each_with_index do |cell, j|
			data[:name] = cell.value if j == 0
			data[:price] = cell.value if j == 1
			data[:quantity] = cell.value if j == 2
		end
		arr << data
		data = { name: "nope", price: 0.00, quantity: 0}
	end
end

arr.sort_by! { |hsh| hsh[:price] }

arr.each { |row| puts "name: #{row[:name]}, price: #{row[:price]}, quantity: #{row[:quantity]}" }