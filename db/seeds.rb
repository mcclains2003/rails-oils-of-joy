# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.name = "Shaun McClain"
user.password = "password"
user.password_confirmation = "password"
user.email = "admin@admin.com"
user.admin = true
user.save

category1 = Category.create(name: "hand cream")
category2 = Category.create(name: "lip gloss")
category3 = Category.create(name: "spray")
category4 = Category.create(name: "scrub")
  
oil1 = Oil.create([ name: "Rose", description: "smells rosy" ])
oil2 = Oil.create([ name: "Lavender", description: "smells lavender-y" ])
oil3 = Oil.create([ name: "Lemon", description: "smells lemony" ])
oil4 = Oil.create([ name: "Tea Tree", description: "smells like a tree" ])

vc1 = VolumeCost.create([ volume: 2, cost: 4 ])
vc2 = VolumeCost.create([ volume: 3, cost: 6 ])
vc3 = VolumeCost.create([ volume: 4, cost: 8 ])
vc4 = VolumeCost.create([ volume: 5, cost: 10 ])

pro1 = Product.new
pro1.name = "Product One"
pro1.description = "Description of product one"
pro1.category_id = category1.id
pro1.oils = oil1
pro1.save

pro2 = Product.new
pro2.name = "Product Two"
pro2.description = "Description of product two"
pro2.category_id = category2.id
pro2.oils = oil2
pro2.save

pro3 = Product.new
pro3.name = "Product Three"
pro3.description = "Description of product three"
pro3.category_id = category3.id
pro3.oils = oil3
pro3.save

pro4 = Product.new
pro4.name = "Product Four"
pro4.description = "Description of product four"
pro4.category_id = category4.id
pro4.oils = oil4
pro4.save