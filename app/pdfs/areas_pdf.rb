class AreasPdf < Prawn::Document
  def initialize(areas, view)
    super(top_margin: 70)
    @areas = areas
    @view = view
    
    areas2
  end
  
  def clave
    text "Area \##{@areas.clave}", size: 30, style: :bold
    text "Area \##{@areas.nombre}", size: 30, style: :bold
  end
  
  def areas_rows  
    text "Listado de Areas", size: 30, style: :bold    
    [["Clave", "Descripcion", "E mail", "Municipio","Responsable"]] +  
    @areas.map do |item|
      [item.clave, item.descripcion, item.correo_electronico, item.municipio, item.responsable]
    end
  end   
  
  def areas2
    move_down 20
    table areas_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
