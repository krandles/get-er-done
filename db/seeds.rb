# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  first_name: "Nemanja",
  last_name: "Drakulovic",
  user_name: "NDrakulovic",
  email: "kenny_homm@gmail.com",
  password: "pass",
  password_confirmation: "pass",
  experience: 0,
  level: 1,
  next_level: 5,
  admin: true
)

User.create(
  first_name: "Kevin",
  last_name: "Randles",
  user_name: "KRandles",
  email: "kevin_randles@gmail.com",
  password: "pass",
  password_confirmation: "pass",
  experience: 0,
  level: 1,
  next_level: 5,
  admin: true
)

User.create(
  first_name: "Kenny",
  last_name: "Homm",
  user_name: "KHomm",
  email: "kenny_homm@gmail.com",
  password: "pass",
  password_confirmation: "pass",
  experience: 0,
  level: 1,
  next_level: 5,
  admin: false
)

User.create(
  first_name: "Maurice",
  last_name: "Roy",
  user_name: "MRoy",
  email: "maurice_roy@gmail.com",
  password: "pass",
  password_confirmation: "pass",
  experience: 0,
  level: 1,
  next_level: 5,
  admin: false
)
