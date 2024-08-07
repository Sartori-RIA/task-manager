# frozen_string_literal: true

class CreateTaskContents < ActiveRecord::Migration[7.1]
  def change
    create_table :task_contents do |t|
      t.json :content
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
