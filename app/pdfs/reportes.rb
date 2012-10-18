# -*- coding: utf-8 -*-
module Reportes
  def encabezado_pie_de_pagina
    repeat(:all, :dynamic => true) do
      image "#{Rails.root}/app/assets/images/izquierda.jpg", :width => 45, :height => 45, :at => [0,750]
      image "#{Rails.root}/app/assets/images/derecha.jpg", :width => 65, :height => 30, :at => [475,750]
      image "#{Rails.root}/app/assets/images/pie_izquierdo.jpg", :width => 70, :height => 30, :at => [0,10]
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