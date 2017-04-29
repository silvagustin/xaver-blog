# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
Usuario.delete_all

# USUARIO ADMINISTRADOR #######################################################
Usuario.create!(email: "admin@hotmail.com",
			   es_admin: true,
			   password: "gaspar")

# USUARIOS COMUNES ############################################################
Usuario.create!(email: "oby_lacueva@hotmail.com",
			   password: "gaspar")

Usuario.create!(email: "xaver@hotmail.com",
			   password: "gaspar")

# POSTS #######################################################################
oby_lacueva = Usuario.find_by(email: "oby_lacueva@hotmail.com")
xaver = Usuario.find_by(email: "xaver@hotmail.com")

2.times do |i|
  i > 0 ? un_usuario = oby_lacueva : un_usuario = xaver

  10.times do
	Post.create!(usuario: un_usuario,
	  			 titulo: "La historia jamas contada.",
	             descripcion: "Érase una vez en lala, un barco chiquito quiso asesinar a un ciudadano.",
	             contenido: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas , las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.")
	end
end

# CONSOLA #####################################################################

puts "Usuarios CREADOS!"
puts "Posts CREADOS!"
