# frozen_string_literal: true

# Migration for creating ads
class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :model
      t.integer :mileage
      t.integer :horsepower
      t.string :fuel
      t.string :gearbox
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
