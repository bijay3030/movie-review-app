# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin1 = User.create(
  email: 'admin1@gmail.com',
  password: 'admin12345',
  first_name: 'Admin1',
  last_name: 'Stha',
  role: 'admin'
)
admin1.confirm

admin2 = User.create(
  email: 'admin2@gmail.com',
  password: 'admin12345',
  first_name: 'Admin2',
  last_name: 'Stha',
  role: 'admin'
)
admin2.confirm
