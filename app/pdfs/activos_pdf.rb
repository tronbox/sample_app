# -*- coding: utf-8 -*-
class ActivosPdf < Prawn::Document
  def initialize(activos, view)
    super(top_margin: 70)
    @activos = activos
    @view = view
    
    activos2
  end
  
  
  def activos_rows  
    text "Reporte de Activos", size: 30, style: :bold    
    [["Id", "Clave", "Descripción", "Area"]] +  
    @activos.map do |item|
      [item.id, item.clave, item.descripcion, item.area.descripcion]
    end
  end  
  
  def activos2
    move_down 20
    table activos_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end