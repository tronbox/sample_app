# -*- coding: utf-8 -*-
class OrdenesServicioPdf < Prawn::Document
  def initialize(ordenes_servicio, view)    
    super(top_margin: 70)
    @ordenes_servicio = ordenes_servicio
    @view = view
    
    itera_ordenes 
    
    
    numero_paginas
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
 
      text "Código de barras:", size: 11, style: :bold
      if item.activo.codigo?
        doc=RGhost::Document.new
        doc.barcode_code39("#{item.activo.codigo}",:columns => 2, :rows=> 2, :text => {:size => 10})
        doc.render :jpeg, :filename => "#{Rails.root}/tmp/barcode.jpeg"
        if File.exist?("#{Rails.root}/tmp/barcode.jpeg")                          
          image "#{Rails.root}/tmp/barcode.jpeg" , :width => 100, :height => 50
        else
          text "No se pudo generar el código de barras, formato soportado = code39", size: 6
        end
      else
        text "Sin código de barras", size: 6
      end
      text "Imagen:", size: 11, style: :bold
      if item.activo.imagen_url?
        if File.exist?("#{item.activo.imagen_url}")
          image "#{item.activo.imagen_url}" , :width => 100, :height => 100
        else
          text "No existe la imagen", size: 6
        end
      else
        text "Sin imagen", size: 6
      end                                      
    
      
      
      
                  
      
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
  
  def numero_paginas
    string = "Página <page> de <total>"    
    options = { :at => [bounds.right - 150, 0],
    :width => 150,
    :align => :right,
    :page_filter => (1..7),
    :start_count_at => 1,
    :color => "007700" }
    number_pages string, options
  end     
end