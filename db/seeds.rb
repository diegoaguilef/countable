# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create name: 'Diego Aguilef', email: 'diego@aguilef.cl', password: 'diego123'
e = Enterprise.create name: 'DPAS IT SpA', business_name: 'Consultant', rut: 77_071_899, dv: 6, user: u
i = Movement.create(
  name: 'TGA Sodimac',
  description: 'pago de servicios',
  issue_date: Date.today,
  net: 1_500_000,
  countable_type: 'income',
  enterprise: e,
  total_iva: 0
)
i = Movement.create(
  name: 'TGA Sodimac',
  description: 'pago de servicios',
  issue_date: Date.today,
  net: 1_000_000,
  countable_type: 'cost',
  enterprise: e,
  total_iva: 0
)
