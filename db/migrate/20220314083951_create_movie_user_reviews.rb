class CreateMovieUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_user_reviews do |t|
      t.text :review
      t.datetime :published_at
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
