require 'prawn/table'
require 'prawn'

class Generator
    include Prawn::View
    
    def initialize(name, data)
        @name = name
        @data = data
        Prawn::Document.new(page_size: "A4", page_layout: :portrait, margin: [30, 60])
        # @data.map { |data| puts "#{data[:name]}, #{data[:quantity]}, #{data[:price]}" }
    end

    # creating the header
    def create_header header
        bounding_box [bounds.left, bounds.top + 10],
        width: bounds.width do 
            text header, size: 9, align: :right
        end
        move_down 20
    end

    # creating the title
    def create_title title
        text "Finance Report", style: :bold, size: 20, align: :center
        move_down 15
    end

    # creating the table
    def create_table
        input_row_items
        table @table do
            header = true, 
            row(0).font_style = :bold,
            self.row_colors = ['FFFFFF', 'DDDDDD'], 
            self.position = :center,
            self.column_widths = 125    
        end
    end

    # inserting data into the table
    def input_row_items
        @table = []
        @table << ['Product', 'Qty', 'Price', 'Total price']
        @data.each do |item|
            @table << [item[:name], item[:quantity], item[:price], item[:total]]
        end
    end

    # saving the file
    def save_as
        render_file @name
    end
end


def generate_report data

    header = "Invoice new"
    name = "../#{data[:name]}.pdf"

    if puts File.exist? name
        File.delete name
    else 
        # creates a new pdf file
        pdf = Generator.new(name, data[:data])
        pdf.create_header header
        pdf.create_title "Finance Report"
        pdf.create_table
        pdf.save_as
    end
end