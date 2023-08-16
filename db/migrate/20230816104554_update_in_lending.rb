# frozen_string_literal: true

class UpdateInLending < ActiveRecord::Migration[7.0]
  def change
    change_column :lendings, :amount, :float, null: false, default: 0.0
    add_check_constraint :lendings, 'amount >= 0'

    change_column :lendings, :repayment, :boolean, default: false
  end
end
