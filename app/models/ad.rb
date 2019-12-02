class Ad < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :horsepower, presence: true
  validates :fuel, presence: true
  validates :gearbox, presence: true
  validates :price, presence: true
end
