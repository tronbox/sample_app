# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
puts "Creando los roles..."
admin = Rol.create(nombre: "administrador")
cap = Rol.create(nombre: "capturista")
resp = Rol.create(nombre: "responsable de nave")
Rol.create(nombre: "tecnico")

puts "Creando el usuario con rol admin..."
u = User.create(email: "admin@example.com", password: "admin#", password_confirmation: "admin#")
u.rol = admin

uc = User.create(email: "capturista@example.com", password: "capturista#", password_confirmation: "capturista#")
uc.rol = cap

ur = User.create(email: "responsable@example.com", password: "responsable#", password_confirmation: "responsable#")
ur.rol = resp


u.save!
