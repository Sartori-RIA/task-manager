# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:notifications)

    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
