class FallasPdf < Prawn::Document
  include Reportes
  def initialize(fallas, view)
    super(top_margin: 70)
    @fallas = fallas
    @view = view
    
    itera_fallas
    numero_paginas
  end

  def fallas_rows  
    encabezado_pie_de_pagina
    text "Reporte de Fallas", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @fallas.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def itera_fallas
    move_down 20
    table fallas_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
