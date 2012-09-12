class AgentesPdf < Prawn::Document
  def initialize(agentes, view)
    super(top_margin: 70)
    @agentes = agentes
    @view = view
    
    agentes2
  end
  
  def clave
    text "Agente \##{@agentes.clave}", size: 30, style: :bold
    text "Agente \##{@agentes.nombre}", size: 30, style: :bold
  end
  
  def agentes_rows  
    text "Reporte de Agentes", size: 30, style: :bold    
    [["Clave", "Nombre", "E mail", "Nave industrial"]] +  
    @agentes.map do |item|
      [item.clave, item.nombre, item.e_mail, item.nave.nombre]
    end
  end   
  
  def agentes2
    move_down 20
    table agentes_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end