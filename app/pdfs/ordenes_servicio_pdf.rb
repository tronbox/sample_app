# -*- coding: utf-8 -*-
class OrdenesServicioPdf < Prawn::Document
  def initialize(ordenes_servicio, view)    
    super(top_margin: 70)
    @ordenes_servicio = ordenes_servicio
    @view = view
    
    itera_ordenes     
    #text "Página:#{page_count}", align: :right
  end
  
  def itera_ordenes    
    text "Orden de Servicio", size: 14, style: :bold, align: :center
    @ordenes_servicio.map do |item|               
      text "Id\: #{item.id}", size: 12, style: :bold
      text "Folio\: #{item.folio}", size: 12, style: :bold
      text "Fecha recepcion\: #{item.fecha_recepcion}", size: 12, style: :bold
      text "Fecha entrega\: #{item.fecha_entrega}", size: 12, style: :bold
      text "Activo\: #{item.activo.descripcion}", size: 12, style: :bold
      text "Series\: #{item.series.nombre}", size: 12, style: :bold      
      #if @orden_servicio.activo.imagen_url?
      #  image "#{@orden_servicio.activo.imagen_url}" , :at => [50,570], :width => 50
      #end              
      
      @fallas = item.falla
      fallas
      
      @reparaciones = item.reparacion
      reparaciones      
    end     
  end

  def fallas_rows  
    text "Fallas", size: 14, style: :bold, align: :left           
    [["Descripcion"]] +  
    @fallas.map do |item|
      [item.descripcion]
    end     
  end   
  
  def fallas
    move_down 20  
    position = :center
    table fallas_rows do      
      row(0).font_style = :bold
      columns(1..1).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true     
    end     
  end   
  
  def reparaciones_rows  
    text "Reparaciones", size: 14, style: :bold, align: :left           
    [["Descripcion"]] +  
    @reparaciones.map do |item|
      [item.descripcion]
    end     
  end   
  
  def reparaciones
    move_down 20
    table reparaciones_rows do
      row(0).font_style = :bold
      columns(1..1).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true     
    end     
  end     
end