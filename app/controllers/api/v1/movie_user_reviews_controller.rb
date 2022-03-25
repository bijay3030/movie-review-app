# frozen_string_literal: true

module Api
  module V1
    class MovieUserReviewsController < ApplicationController
      before_action :authenticate_user!, only: %i[create]
      before_action :set_movie, only: %i[create]

      # POST   /api/v1/movie/:movie_id/movie_user_reviews
      def create
        authorize(MovieUserReview, :create?)
        @movie_user_review = @movie.movie_user_reviews.build(movie_user_params.merge(user_id: current_user.id))
        if @movie_user_review.save
          render(json: @movie, status: :created)
        else
          render(json: @movie_user_review.errors, status: :unprocessable_entity)
        end
      end

      private

      def movie_user_params
        params.require(:movie_user_review).permit(:review, :published_at, :rating)
      end

      def set_movie
        @movie = Movie.find(params[:movie_id])
      end
    end
  end
end
