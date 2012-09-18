class SeriesPdf < Prawn::Document
  def initialize(series, view)
    super(top_margin: 70)
    @series = series
    @view = view
    
    series2
  end
  
  def clave
    text "Serie \##{@series.clave}", size: 30, style: :bold
    text "Serie \##{@series.descripcion}", size: 30, style: :bold
  end
  
  def series_rows  
    text "Listado de Series", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @series.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def series2
    move_down 20
    table series_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
