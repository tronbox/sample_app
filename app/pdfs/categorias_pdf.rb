class CategoriasPdf < Prawn::Document
  def initialize(categorias, view)
    super(top_margin: 70)
    @categorias = categorias
    @view = view
    
    categorias2
  end
  
  def clave
    text "Categoria \##{@categorias.clave}", size: 30, style: :bold
    text "Categoria \##{@categorias.descripcion}", size: 30, style: :bold
  end
  
  def categorias_rows  
    text "Reporte de Categorias", size: 30, style: :bold    
    [["Clave", "Descripcion"]] +  
    @categorias.map do |item|
      [item.clave, item.descripcion]
    end
  end   
  
  def categorias2
    move_down 20
    table categorias_rows do
      row(0).font_style = :bold
      columns(1..2).align = :center
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end          
  end   
end
