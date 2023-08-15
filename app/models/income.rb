# frozen_string_literal: true

class Income < ApplicationRecord
  validates :user_id, presence: true
  validates :income_type, presence: true, on: :create
  validates :amount, presence: true, on: :create
  validates :source, presence: true, length: { minimum: 1 }
end
