# frozen_string_literal: true

class Expense < ApplicationRecord
  validates :user_id, presence: true
  validates :expense_type, presence: true, on: :create
  validates :amount, presence: true, on: :create
  validates :medium, presence: true, on: :create
end
