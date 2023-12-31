# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_movie, only: %i[show update destroy]

      # GET    /api/v1/movies
      def index
        @movies = Movies::Find.new(Movie, params).execute
        respond_to do |format|
          if params[:csv] == 'false'
            format.json { render(json: @movies, each_serializer: MovieSerializer) }
          else
            format.html { send_data(@movies.to_csv(@movies)) }
          end
        end
      end

      # POST   /api/v1/movies
      def create
        authorize(Movie, :create?)
        movie = Movie.new(movie_params)
        if movie.save
          render(json: movie, status: :created)
        else
          render(json: movie.errors, status: :unauthorized)
        end
      end

      # GET    /api/v1/movie/:id
      def show
        render(json: @movie)
      end

      # PATCH  /api/v1/movie/:id
      def update
        authorize(@movie, :create?)
        if @movie.update(movie_params)
          render(json: @movie)
        else
          render(json: @movie.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /api/v1/movies/:id
      def destroy
        authorize(@movie, :create?)
        if @movie.destroy
          render(json: { message: I18n.t('movie.deleted') }, status: :no_content)
        else
          render(json: @movie.errors, status: :unprocessable_entity)
        end
      end

      private

      def movie_params
        params.require(:movie).permit(:name,
                                      :length_in_minutes,
                                      :release_date,
                                      :summary,
                                      :cover_image,
                                      genre: [],
                                      directors: [],
                                      actors: [],
                                      writers: [],
                                      producers: []
                                     )
      end

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end
