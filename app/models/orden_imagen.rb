class OrdenImagen < ActiveRecord::Base
  belongs_to :orden_servicio
  has_attached_file :imagen, :styles => { :small => "150x150>" },  
  :url => "/system/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"  
  validates_attachment_presence :imagen  
  validates_attachment_size :imagen, :less_than => 5.megabytes  
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png'], :message => "Formato de imagen No aceptado, permitidos (.jpeg, .png)"
  
  attr_accessible :imagen
end
