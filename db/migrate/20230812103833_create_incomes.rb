# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.float :amount
      t.string :source

      t.timestamps
    end
  end
end
