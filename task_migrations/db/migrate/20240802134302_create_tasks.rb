# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:tasks)

    create_table :tasks do |t|
      t.integer :status
      t.string :url

      t.timestamps
    end
  end
end
