class AddIndexToMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :movies, :name, unique: true
  end
end
