# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :genre, :length_in_minutes, :release_date, :directors, :actors, :writers, :summary, :producers,
             :aggregate_rating, :cover_image_url

  has_many :movie_user_reviews

  def aggregate_rating
    object.aggregate(object)
  end

  def cover_image_url
    # to return original asset
    object.cover_image.url if object.cover_image.attached?
  end
end
