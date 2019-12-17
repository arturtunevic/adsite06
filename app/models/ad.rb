# frozen_string_literal: true

# Ad model
class Ad < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :model, presence: true
  validates :mileage, presence: true, numericality: { only_integer: true }
  validates :horsepower, presence: true, numericality: { only_integer: true }
  validates :fuel, presence: true
  validates :gearbox, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
