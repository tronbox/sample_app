class AgentesPdf < Prawn::Document
  include Reportes
  def initialize(agentes, view)
    super(top_margin: 70)
    @agentes = agentes
    @view = view
    
    itera_agentes
    numero_paginas
  end
  
  def agentes_rows  
    encabezado_pie_de_pagina
    text "Reporte de Agentes", size: 30, style: :bold    
    [["Clave", "Nombre", "E mail", "Nave industrial"]] +  
    @agentes.map do |item|
      [item.clave, item.nombre, item.e_mail, item.nave.nombre]
    end
  end   
  
  def itera_agentes
    move_down 20
    table agentes_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end