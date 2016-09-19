# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

companies = [
   { name: "Abelardo's"},
   { name: "Chipotle"},
   { name: "Taco Bell"}
]

companies.each do |attributes|
  Company.find_or_initialize_by(name: attributes[:name]).tap do |company|
    company.name = attributes[:name]
    company.save!
  end
end

users = [
   { email: "joseluis@abelardos.com", username: "joseluis_torres", company_id: 1},
   { email: "daniela@abelardos.com", username: "daniela", company_id: 1},
   { email: "elena@chipotle.com", username: "elena", company_id: 2},
   { email: "lila@chipotle.com", username: "lila", company_id: 2},
   { email: "rebecca@tacobell.com", username: "rebecca", company_id: 3},
]

users.each do |attributes|
  User.find_or_initialize_by(email: attributes[:email]).tap do |user|
    user.email = attributes[:email]
    user.username = attributes[:username]
    user.company_id = attributes[:company_id]
    user.save!
  end
end

machine_data = [
   { name: "Tacos de Pastor", preread_json: { ingredients: { tortillas: 4, meat: 'pork', vegetables: ['onion', 'cilantro'] } }, user_id: 1},
   { name: "Torta de Adobada", preread_json: { ingredients: { bread: 1, meat: 'pork', vegetables: ['onion', 'cilantro'] } }, user_id: 1},
   { name: "Chilaquiles", preread_json: { ingredients: { tortillas: 6, meat: 'chicken', vegetables: ['onion'] } }, user_id: 2},
   { name: "Tamales", preread_json: { ingredients: { masa: 1, meat: 'pork', vegetables: ['tomato'] } }, user_id: 2},
   { name: "Pozole", preread_json: { ingredients: { tostadas: 4, meat: 'pork', vegetables: ['onion', 'cilantro', 'oregano'] } }, user_id: 3},
   { name: "Birria", preread_json: { ingredients: { tortillas: 10, meat: 'pork', vegetables: ['onion', 'cilantro'] } }, user_id: 3},
   { name: "Ceviche", preread_json: { ingredients: { tostadas: 10, meat: 'fish', vegetables: ['onion', 'cilantro', 'carrots', 'cucumbers'] } }, user_id: 4},
   { name: "Tacos de Barbacoa", preread_json: { ingredients: { tortillas: 4, meat: 'cow', vegetables: ['onion', 'cilantro', 'avocado'] } }, user_id: 4},
   { name: "Torta ahogada", preread_json: { ingredients: { bread: 1, meat: 'pork', vegetables: ['onion', 'cilantro', 'lime'] } }, user_id: 5},
   { name: "Carnitas", preread_json: { ingredients: { tortillas: 5, meat: 'pork', vegetables: ['onion', 'cilantro', 'carrots'] } }, user_id: 5}
]

machine_data.each do |attributes|
  MachineDatum.find_or_initialize_by(name: attributes[:name]).tap do |md|
    md.name = attributes[:name]
    md.preread_json = attributes[:preread_json]
    md.user_id = attributes[:user_id]
    md.save!
  end
end
