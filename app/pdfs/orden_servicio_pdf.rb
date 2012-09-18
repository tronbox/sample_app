# -*- coding: utf-8 -*-
class OrdenServicioPdf < Prawn::Document
  def initialize(orden_servicio, view)
    super(top_margin: 70)
    @orden_servicio = orden_servicio
    @view = view
    
    orden_servicio_reporte
  end
  
  def orden_servicio_reporte
    text "Orden de Servicio", size: 11, style: :bold, align: :center, font: :arial  
    text "Id\: #{@orden_servicio.id}", size: 11, style: :bold
    text "Folio\: #{@orden_servicio.folio}", size: 11, style: :bold
    text "Fecha recepcion\: #{@orden_servicio.fecha_recepcion}", size: 11, style: :bold
    text "Fecha entrega\: #{@orden_servicio.fecha_entrega}", size: 11, style: :bold    
    text "Activo\: #{@orden_servicio.activo.descripcion}", size: 11, style: :bold
    text "Series\: #{@orden_servicio.series.nombre}", size: 11, style: :bold 
    text "Descripción\: #{@orden_servicio.descripcion}", size: 11, style: :bold, font: :arial              
    text "Código de barras:", size: 11, style: :bold
    doc=RGhost::Document.new
    doc.barcode_ean13("#{@orden_servicio.activo.codigo}",:columns => 2, :rows=> 2, :text => {:size => 10})
    doc.render :jpeg, :filename => "#{Rails.root}/tmp/barcode.jpeg"                          
    image "#{Rails.root}/tmp/barcode.jpeg" , :at => [100,580], :width => 500
    text ""
    text ""
    text ""
    text "Imagen:", size: 11, style: :bold
    if @orden_servicio.activo.imagen_url?
      if File.exist?("#{@orden_servicio.activo.imagen_url}")
        image "#{@orden_servicio.activo.imagen_url}" , :at => [300,580], :width => 160
      else
        text "No existe la imagen"
      end
    end                                      
    
    fallas   
    reparaciones
  end  
  
  def fallas_rows  
    text "Fallas", size: 11, style: :bold, align: :left           
    [["Descripcion"]] +  
    @orden_servicio.falla.map do |item|
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
    text "Reparaciones", size: 11, style: :bold, align: :left           
    [["Descripcion"]] +  
    @orden_servicio.reparacion.map do |item|
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