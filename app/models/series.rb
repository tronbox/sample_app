class Series < ActiveRecord::Base
  attr_accessible :nombre

  validates :nombre, presence: true, uniqueness: { case_sensitive: false }

end
