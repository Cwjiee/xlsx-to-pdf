require 'rubyXL'
require 'rubyXL/convenience_methods'

class Parser

  def set_file
    print 'file name : '
    name = gets.chomp
    workbook = RubyXL::Parser.parse("../#{name}.xlsx")
    workbook[0]
    # workbook = RubyXL::Parser.parse('../workbook1.xlsx')
  end

  def set_data(worksheet)
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

    arr
  end

  def sort(arr)
    arr.sort_by! { |hsh| hsh[:price] }
  end

  def get_data(arr)
    puts
    arr.each { |row| puts "name: #{row[:name]}, price: #{row[:price]}, quantity: #{row[:quantity]}" }
    puts
  end
end