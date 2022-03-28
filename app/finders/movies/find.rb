# frozen_string_literal: true

module Movies
  class Find
    attr_reader :scope, :search_query, :sorts

    def initialize(scope, params)
      @scope = Movie.where(nil) || scope
      @search_query = params[:search_query]
      @sorts = params[:sorts]
    end

    def execute
      return scope if search_query.blank? && sorts.blank?

      movies = search_movies(scope)
      sort_movies(movies)
    end

    private

    def search_movies(scope)
      return scope if search_query.blank?

      scope.where('name LIKE ?', "%#{search_query}%")
    end

    def sort_movies(movies)
      return movies if sorts.blank?

      @movies = @sorts.casecmp('ascending').zero? ? movies.order(:release_date) : movies.order('release_date DESC')
    end
  end
end
