# -*- coding: utf-8 -*-
class Vehiculo < ActiveRecord::Base
  validates :numero_de_serie, :presence => true, :uniqueness => { :message => "El número de serie ya existe!"}
  validates :numero_de_motor, :presence => true, :uniqueness => { :message => "El número de motor ya existe!"}
  attr_accessible :capacidad, :cilindros, :clase, :clave_vehicular, :combustible, :linea, :marca, :modelo, :numero_de_motor, :numero_de_puertas, :numero_de_serie, :procedencia, :tipo
end
