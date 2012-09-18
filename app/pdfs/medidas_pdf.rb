class MedidasPdf < Prawn::Document
  def initialize(medidas, view)
    super(top_margin: 70)
    @medidas = medidas
    @view = view
    
    medidas2
  end
  
  def clave
    text "Medida \##{@medidas.clave}", size: 30, style: :bold
    text "Medida \##{@medidas.descripcion}", size: 30, style: :bold
  end
  
  def medidas_rows  
    text "Listado de Medidas", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @medidas.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def medidas2
    move_down 20
    table medidas_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
