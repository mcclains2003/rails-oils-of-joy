Paulines site

-User
  has_many :carts
  belongs_to :current_cart, :class_name => 'Cart'

  first name
  last name
  username
  email
  password
  current_cart_id    default to nil

-Product (resource)
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :product_variables
  has_many :variables, through: :product_variables
  
  category_id
  name
  description
  
-Oil (resource)
  has_many :product_oils
  has_many :products, through: :product_oils

  name
  description

-ProductOils (model)
  belongs_to product
  belongs_to oil

-Category (controller)
  has_many :products

  name (ex. cream, salt scrub, ect)

-Variants (controller)
  has_many :product_variants
  has_many :products, through: :product_variants

  size

-ProductVariants (model)
  belongs_to :product
  belongs_to :variant

  cost



THINGS TO THINK ABOUT

-Cart
  has_many :product_items
  has_many :products, through: :product_items
  belongs_to :user

  user_id
  status

-CartProducts
  belongs_to :product
  belongs_to :cart

  product_id
  cart_id



