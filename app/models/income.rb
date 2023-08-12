# frozen_string_literal: true

class Income < ApplicationRecord
  validates :amount, presence: true, on: :create
  validates :source, presence: true, length: { minimum: 1 }
end
