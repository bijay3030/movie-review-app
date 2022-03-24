# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin1 = User.create!(
  email: 'admin1@gmail.com',
  password: Rails.application.credentials[:admin1_password],
  first_name: 'Admin1',
  last_name: 'Stha1',
  role: 'admin'
)
admin1.confirm

admin2 = User.create!(
  email: 'admin2@gmail.com',
  password: Rails.application.credentials[:admin2_password],
  first_name: 'Admin2',
  last_name: 'Stha2',
  role: 'admin'
)
admin2.confirm

# Movie instance
Movie.create!(
  name: 'The Shawshank Redemption',
  genre: ['Drama'],
  length_in_minutes: '144',
  release_date: '1994-02-23T00:00:00.213Z',
  directors: ['Frank Darabont'],
  actors: ['Tim Robbins', 'Morgan Freeman'],
  writers: ['Stephen King', 'Frank Darabont'],
  summary: 'Chronicles the experiences of a formerly successful banker as a prisoner in the gloomy jailhouse of',
  producers: ['Castle Rock Entertainment']
)

Movie.create!(
  name: 'The Prestige',
  genre: %w[Mystery Thriller],
  length_in_minutes: '135',
  release_date: '2022-02-23T07:10:24.213Z',
  directors: ['Christopher Nolan'],
  actors: ['Christian Bale', 'Hugh Jackman'],
  writers: ['Jonathan Nolan'],
  summary: 'In the end of the nineteenth century, in London, Robert Angier, his beloved wife Julia McCullough.',
  producers: ['Castle Rock Entertainment']
)
