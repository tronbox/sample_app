class FallasPdf < Prawn::Document
  def initialize(fallas, view)
    super(top_margin: 70)
    @fallas = fallas
    @view = view
    
    fallas2
  end
  
  def clave
    text "Falla \##{@fallas.clave}", size: 30, style: :bold
    text "Falla \##{@fallas.descripcion}", size: 30, style: :bold
  end
  
  def fallas_rows  
    text "Reporte_de_Fallas", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @fallas.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def fallas2
    move_down 20
    table fallas_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
