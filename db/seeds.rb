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
Rol.create(nombre: "capturista")
Rol.create(nombre: "responsable de nave")
Rol.create(nombre: "tecnico")

puts "Creando el usuario con rol admin..."
u = User.create(email: "admin@example.com", password: "admin#", password_confirmation: "admin#")
u.rol = admin
u.save!
