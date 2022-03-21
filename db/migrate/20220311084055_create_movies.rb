# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table(:movies) do |t|
      t.string(:name)
      t.string(:genre, array: true, default: [])
      t.integer(:length_in_minutes)
      t.date(:release_date)
      t.string(:directors, array: true, default: [])
      t.string(:actors, array: true, default: [])
      t.string(:writers, array: true, default: [])
      t.text(:summary)
      t.string(:producers, array: true, default: [])

      t.timestamps
    end
  end
end
