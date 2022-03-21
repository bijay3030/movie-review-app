# frozen_string_literal: true

class MovieUserReview < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :review, presence: true
  validates :rating, presence: true, numericality: { in: 0..10 }
  validates :published_at, presence: true
end
