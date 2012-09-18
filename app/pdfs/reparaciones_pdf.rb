# -*- coding: utf-8 -*-
class ReparacionesPdf < Prawn::Document
  def initialize(reparaciones, view)
    super(top_margin: 70)
    @reparaciones = reparaciones
    @view = view
    
    reparaciones2
  end
 
  
  def reparaciones_rows  
    text "Catalogo_de_Reparaciones", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @reparaciones.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def reparaciones2
    move_down 20
    table reparaciones_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
