class AgentePdf < Prawn::Document
  include Reportes
  def initialize(agente, view)
    super(top_margin: 70)
    @agente = agente
    @view = view
    
    agente_reporte
    numero_paginas
  end
  
  def agente_reporte
    encabezado_pie_de_pagina
    
    text "Clave\: #{@agente.clave}", size: 14, style: :bold
    text "Nombre\: #{@agente.nombre}", size: 14, style: :bold
    text "E mail\: #{@agente.e_mail}", size: 14, style: :bold
    text "Nave industrial\: #{@agente.nave.nombre}", size: 14, style: :bold
  end
end