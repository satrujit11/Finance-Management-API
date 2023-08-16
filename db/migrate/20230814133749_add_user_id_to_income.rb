# frozen_string_literal: true

class AddUserIdToIncome < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :user_id, :integer
  end
end
