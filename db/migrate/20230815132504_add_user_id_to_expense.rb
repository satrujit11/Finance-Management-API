# frozen_string_literal: true

class AddUserIdToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :user_id, :integer
  end
end
