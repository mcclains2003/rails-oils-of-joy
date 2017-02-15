# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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

ProductOil.create([
  { product_id: product.first.id, oil_id: oil.first.id }
  ])

ProductVariant.create([
  { product_id: product.first.id, variant_id: variant.first.id, price: 8.00 }, { product_id: product.first.id, variant_id: variant.last.id, price: 5.00 }
  ])