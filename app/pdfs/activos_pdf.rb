# -*- coding: utf-8 -*-
class ActivosPdf < Prawn::Document
  include Reportes
  def initialize(activos, view)
    super(top_margin: 70)
    @activos = activos
    @view = view
    
    itera_activos
    numero_paginas
  end
  
  
  def activos_rows 
    encabezado_pie_de_pagina
          
    #Dibuja las lineas          
    indent(0) do
      stroke_horizontal_rule
      move_down 5         
      text "Reporte de Activos", size: 14, style: :bold, align: :center
      stroke_horizontal_rule
    end
    move_down 5
           
    [["Id", "Clave", "Descripción", "Area"]] +  
    @activos.map do |item|
      [item.id, item.clave, item.descripcion, item.area.descripcion]
    end   
  end  
  
  def itera_activos
    move_down 20
    table activos_rows do
      row(0).font_style = :bold
      columns(1..4).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end