require 'rubyXL'
require 'rubyXL/convenience_methods'

class Parser

  def initialize(name)
    @workbook = RubyXL::Parser.parse("../#{name}.xlsx")
  end

  # looks for a specific worksheet inside a workbook
  def set_file
    @worksheet = @workbook[0]
    # workbook = RubyXL::Parser.parse('../workbook1.xlsx')
  end

  # stores the relevant data
  def set_data
    @arr = []
    data = { name: "nope", price: 0.00, quantity: 0}

    @worksheet.each_with_index do |row, i|
      if i!= 0
        row && row.cells.each_with_index do |cell, j|
          data[:name] = cell.value if j == 0
          data[:price] = cell.value if j == 1
          data[:quantity] = cell.value if j == 2
        end
        @arr << data
        data = { name: "nope", price: 0.00, quantity: 0}
      end
    end
  end

  # sorts the data in ascending order
  def sort
    @arr.sort_by! { |hsh| hsh[:price] }
  end

  # displays the data
  def get_data
    puts
    @arr.each { |row| puts "name: #{row[:name]}, price: #{row[:price]}, quantity: #{row[:quantity]}" }
    puts
  end
end

def run_parser 
  print 'file name : '
  name = gets.chomp

  parser = Parser.new(name)
  parser.set_file
  parser.set_data
  parser.sort
  parser.get_data
end