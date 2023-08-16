# frozen_string_literal: true

class AddUserIdToLending < ActiveRecord::Migration[7.0]
  def change
    add_column :lendings, :user_id, :integer
  end
end
