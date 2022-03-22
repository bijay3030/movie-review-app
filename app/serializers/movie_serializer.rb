# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :genre, :length_in_minutes, :release_date, :directors, :actors, :writers, :summary, :producers,
             :aggregate_rating, :cover_image_url

  has_many :movie_user_reviews

  def aggregate_rating
    no_of_ratings = object.movie_user_reviews.count
    sum = 0
    object.movie_user_reviews.each do |review|
      sum += review.rating
    end
    sum.zero? ? nil : (sum / no_of_ratings).round(2)
  end

  def cover_image_url
    # to return original asset
    rails_blob_path(object.cover_image, only_path: true) if object.cover_image.attached?
  end
end
