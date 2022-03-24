# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :length_in_minutes, presence: true
  validates :release_date, presence: true
  validates :directors, presence: true
  validates :actors, presence: true
  validates :writers, presence: true
  validates :summary, presence: true
  validates :producers, presence: true

  has_many :movie_user_reviews, dependent: :destroy
  has_one_attached :cover_image

  def aggregate(movie)
    no_of_ratings = movie.movie_user_reviews.count
    sum = 0
    movie.movie_user_reviews.each do |review|
      sum += review.rating
    end
    sum.zero? ? nil : (sum / no_of_ratings).round(2)
  end

  def self.to_csv(movies)
    attributes = %w[id name aggregate_rating]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      movies.each do |movie|
        each_record = []
        movie.attributes.values_at('id', 'name').each do |attr|
          each_record << attr
        end
        each_record << movie.aggregate(movie)
        csv << each_record
      end
    end
  end
end
