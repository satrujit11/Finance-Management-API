# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :expense_type
      t.string :medium
      t.string :medium_name

      t.timestamps
    end
  end
end
