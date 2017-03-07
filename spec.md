# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    (YUP!)

- [x] Include at least one has_many relationship 
    (Category has many Products,
     Product has many VolumeCosts) 

- [x] Include at least one belongs_to relationship 
    (Product belongs to Category, VolumeCost belongs to Product)

- [x] Include at least one has_many through relationship 
    (Oil has many Products through ProductOils,
     Product has many Oils throught ProductOils )

- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

- [x] Include reasonable validations for simple model objects 
    (Many validations for all my models including:
      - Presence,
      - Numeralcality,
      - Uniqueness,
      - Format,
      - Confirmation)

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

- [x] Include signup 
    (created my own using bcrypt)

- [x] Include login 
    (created my own using bcrypt)

- [x] Include logout 
    (created my own using bcrypt)

- [x] Include third party signup/login 
    (Using OmniAuth-Facebook)

- [x] Include nested resource show or index 
    (Product new, create, and index actions nested under categories resource e.g. categories/2/products)

- [x] Include nested resource "new" form 
    (URL e.g. categories/2/products/new)

- [x] Include form display of validation errors 
    (Errors show up when validations not met)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate