class Series < ActiveRecord::Base
  attr_accessible :nombre
  has_many :series

  validates :nombre, presence: true, uniqueness: { case_sensitive: false }

end
