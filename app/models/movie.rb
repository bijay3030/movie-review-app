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
end
