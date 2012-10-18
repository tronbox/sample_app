class MedidasPdf < Prawn::Document
  include Reportes
  def initialize(medidas, view)
    super(top_margin: 70)
    @medidas = medidas
    @view = view
    
    itera_medidas
    numero_paginas
  end

  def medidas_rows 
    encabezado_pie_de_pagina 
    text "Listado de Medidas", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @medidas.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def itera_medidas
    move_down 20
    table medidas_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
