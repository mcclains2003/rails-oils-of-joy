# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   Item.create(
#     title: Faker::Commerce.product_name,
#     inventory: Faker::Number.number(2),
#     price: Faker::Number.number(4)
#   )
#   Category.create(title: Faker::Commerce.department)

# end

# counter = 1
# Item.all.each do |item|
#   item.category_id = counter
#   item.save
#   counter += 1
# end

# User.create(
#   email: "dak@prescott.com",
#   password: "87654321",
#   password_confirmation: "87654321"
# )


category = Category.create([
  { name: "Lotion" }, { name: "Scrub" }
  ])
  
oil = Oil.create([
  { name: "Rose", description: "smells rosy" }, { name: "Lemon", description: "smells lemony" }
  ])

variant = Variant.create([
  { size: "8 oz" }, { size: "6 oz" }
  ])

product = Product.create([
  { name: "Happy Feet", description: "Makes feet happy", category_id: category.first.id }
  ])

ProductOil.create(product_id: product, oil_id: oil.first)

ProductVariant.create(product_id: product, variant_id: variant.first, price: 8.00)
