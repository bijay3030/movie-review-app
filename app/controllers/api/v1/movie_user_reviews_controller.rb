# frozen_string_literal: true

module Api
  module V1
    class MovieUserReviewsController < ApplicationController
      before_action :authenticate_user, only: %i[create]
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

      def authenticate_user
        if request.headers['Authorization']
          bearer_token = request.headers['Authorization'].split.last
          decoded_value = JWT.decode(bearer_token, Rails.application.credentials.DEVISE_JWT_SECRET_KEY)
          user_id = Integer(decoded_value[0]['sub'], 10)
          @user = User.find_by(id: user_id)
        else
          # no bearer token detected
          render(json: { message: I18n.t('user.bearer_token.not_found') }, status: :unprocessable_entity)
        end
      end
    end
  end
end
