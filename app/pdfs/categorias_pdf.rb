class CategoriasPdf < Prawn::Document
  include Reportes
  def initialize(categorias, view)
    super(top_margin: 70)
    @categorias = categorias
    @view = view
    
    itera_categorias
    numero_paginas
  end

  def categorias_rows  
    encabezado_pie_de_pagina
    text "Reporte de Categorias", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @categorias.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def itera_categorias
    move_down 20
    table categorias_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
