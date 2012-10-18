# -*- coding: utf-8 -*-
class ReparacionesPdf < Prawn::Document
  include Reportes
  def initialize(reparaciones, view)
    super(top_margin: 70)
    @reparaciones = reparaciones
    @view = view
    
    itera_reparaciones
    numero_paginas
  end
 
  
  def reparaciones_rows  
    encabezado_pie_de_pagina
    text "Catalogo de Reparaciones", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @reparaciones.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def itera_reparaciones
    move_down 20
    table reparaciones_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
