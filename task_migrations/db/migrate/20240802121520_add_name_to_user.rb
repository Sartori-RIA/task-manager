# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[7.1]
  def change
    return if column_exists?(:users, :name)

    add_column :users, :name, :string
  end
end
