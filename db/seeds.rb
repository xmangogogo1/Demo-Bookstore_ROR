# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


product = Product.create([{name: 'JavaScript JQeury for front-end', description: 'entry level', image: "/images/new2.jpg", price: 27.6 }, 
						{name: 'Programming Ruby 1.9 & 2.0', description: 'medium level', image: "/images/ruby2.jpeg", price: 35.2 }, 
						{name: 'Everyday Scritping with Ruby', description: 'master level', image: "/images/ruby3.jpg", price: 32.1 },
						{name: 'Agile web Development with Rails 4', description: 'entry-master level', image: "/images/ruby4.png", price: 55.6 } 

	])
