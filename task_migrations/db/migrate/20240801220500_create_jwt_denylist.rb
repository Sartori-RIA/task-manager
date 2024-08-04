# frozen_string_literal: true

class CreateJwtDenylist < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:jwt_denylist)

    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_denylist, :jti
  end
end
