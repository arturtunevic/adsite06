# frozen_string_literal: true

# Migration for adding roles
class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true
    add_column :users, :user_role, :boolean, default: true
  end
end
