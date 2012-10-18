class SeriesPdf < Prawn::Document
  include Reportes
  def initialize(series, view)
    super(top_margin: 70)
    @series = series
    @view = view
    
    itera_series
    numero_paginas
  end
  
  def series_rows  
    encabezado_pie_de_pagina
    text "Listado de Series", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @series.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def itera_series
    move_down 20
    table series_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
