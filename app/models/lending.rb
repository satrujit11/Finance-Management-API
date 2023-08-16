# frozen_string_literal: true

class Lending < ApplicationRecord
  validates :user_id, presence: true
  validates :amount, presence: true, on: :create
  validates :person, presence: true, on: :create
  validates :repayment, presence: true, on: :complete

  before_create :set_default_lending_date_if_nil

  private

  def set_default_lending_date_if_nil
    self.lending_date = Date.current if lending_date.nil?
  end
end
