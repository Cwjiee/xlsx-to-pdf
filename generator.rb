require 'prawn'

class Generator
    include Prawn::View
    
    def initialize(name)
        @name = name
        Prawn::Document.new(page_size: "A4", page_layout: :portrait, margin: [30, 60])
    end

    def create_header(header)
        bounding_box [bounds.left, bounds.top + 10],
        width: bounds.width do 
            text header, size: 9, align: :right
        end
    end

    def save_as
        render_file @name
    end
end

def generate_report

    name = "example.pdf"
    header = "Version 1.0"

    if puts File.exist?(name)
        File.delete(name)
    else 
        # creates a new pdf file
        pdf = Generator.new(name)
        pdf.create_header(header)
        
        pdf.move_down 15
    
        pdf.text "Finance Report", style: :bold, size: 15
        pdf.move_down 15
    
        pdf.save_as
    end
end