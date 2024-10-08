# frozen_string_literal: true

class AddUserToTask < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
