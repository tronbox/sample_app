# -*- coding: utf-8 -*-
filename = "/home/angel/Documentos/AppPemex/sample_app/app/pdfs/headers_pdf.rb"
class OrdenesServicioPdf < Prawn::Document
  def initialize(ordenes_servicio, view)    
    super(top_margin: 70)
    @ordenes_servicio = ordenes_servicio
    @view = view
    
    itera_ordenes 
 
    numero_paginas    
  end
  
  def itera_ordenes 
    encabezado_pie_de_pagina  
    
    gap = 20
    bounding_box([margin_box.left, margin_box.top - 0], :width => margin_box.width, :height => margin_box.height - 120) do      
      #Dibuja las lineas          
      indent(0) do
        stroke_horizontal_rule
        move_down 5         
        text "Orden de Servicio", size: 14, style: :bold, align: :center
        stroke_horizontal_rule
      end
      move_down 5
        
      #Itera todas las ordenes de servicio que se hayan encontrado en el Query  
      @ordenes_servicio.map do |item|
        #indent(60) do         
        #end                                          
        text " _" * 54          
        text "Series\: #{item.series.nombre}     Folio\: #{item.folio}               Fecha recepción\: #{item.fecha_recepcion}               Fecha entrega\: #{item.fecha_entrega}", size: 12, style: :bold               
        text "Nombre del Activo\: #{item.activo.descripcion}", size: 12, style: :bold
        text "Descripción\: #{item.descripcion}", size: 12, style: :bold               
        #Código de barras
        text "Código de barras:", size: 11, style: :bold               
        if item.activo.codigo?
          doc=RGhost::Document.new :paper => [5,2]
          doc.barcode_code39("#{item.activo.codigo}",:columns => 2, :rows=> 2, :text => {:size => 10})
          doc.render :jpeg, :filename => "#{Rails.root}/tmp/#{item.activo.codigo}.jpeg"
          if File.exist?("#{Rails.root}/tmp/#{item.activo.codigo}.jpeg")                          
            image "#{Rails.root}/tmp/#{item.activo.codigo}.jpeg" , :width => 75, :height => 45
          else
            text "No se pudo generar el código de barras, formato soportado = code39", size: 6
          end
        else
          text "Sin código de barras", size: 6
        end
        #Imágen
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
        
        move_down 10    
      end
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
  
  def encabezado_pie_de_pagina
    repeat(:all, :dynamic => true) do
      image "#{Rails.root}/app/assets/images/izquierda.jpg", :width => 45, :height => 45, :at => [0,750]
      image "#{Rails.root}/app/assets/images/derecha.jpg", :width => 65, :height => 30, :at => [475,750]
      image "#{Rails.root}/app/assets/images/pie_izquierdo.jpg", :width => 70, :height => 30, :at => [0,10]
    end
  end
     
end