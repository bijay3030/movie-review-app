# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users) do |t|
      t.string(:email, null: false)
      t.string(:password)
      t.string(:first_name)
      t.string(:last_name)
      t.string(:role)

      t.timestamps
    end
  end
end
