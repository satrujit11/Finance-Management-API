# frozen_string_literal: true

class CreateLendings < ActiveRecord::Migration[7.0]
  def change
    create_table :lendings do |t|
      t.float :amount
      t.string :person
      t.boolean :repayment

      t.timestamps
    end
  end
end
