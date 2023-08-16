# frozen_string_literal: true

class AddColumnsToLending < ActiveRecord::Migration[7.0]
  def change
    add_column :lendings, :lending_date, :date
    add_column :lendings, :expected_repayment_date, :date
    add_column :lendings, :repayment_date, :date
  end
end
