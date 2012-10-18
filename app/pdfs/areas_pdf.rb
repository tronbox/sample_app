class AreasPdf < Prawn::Document
  include Reportes
  def initialize(areas, view)
    super(top_margin: 70)
    @areas = areas
    @view = view
    
    itera_areas
    numero_paginas
  end
  
  def areas_rows 
    encabezado_pie_de_pagina 
    text "Listado de Areas", size: 30, style: :bold    
    [["Clave", "Descripcion", "E mail", "Municipio","Responsable"]] +  
    @areas.map do |item|
      [item.clave, item.descripcion, item.correo_electronico, item.municipio, item.responsable]
    end
  end   
  
  def itera_areas
    move_down 20
    table areas_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
