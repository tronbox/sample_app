class RelacionArticuloMedida < ActiveRecord::Base
  validates :unidades_por_empaque, :length => {:maximum => 4, :minimum => 1}
  validates_uniqueness_of :articulo_id, :scope => :medida_id
  belongs_to :articulo
  belongs_to :medida
  attr_accessible :articulo_id, :medida_id, :unidades_por_empaque
end
