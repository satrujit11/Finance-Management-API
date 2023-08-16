# frozen_string_literal: true

class UpdateInExpenseAndIncome < ActiveRecord::Migration[7.0]
  def change
    change_column :expenses, :amount, :float, null: false, default: 0.0
    add_check_constraint :expenses, 'amount >= 0'

    change_column :incomes, :amount, :float, null: false, default: 0.0
    add_check_constraint :incomes, 'amount >= 0'
  end
end
