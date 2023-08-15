class AddTagToIncome < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :income_type, :string
  end
end
