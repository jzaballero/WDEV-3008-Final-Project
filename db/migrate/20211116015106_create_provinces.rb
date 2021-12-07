# frozen_string_literal: true

# Create provinces table
class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :PST
      t.decimal :GST
      t.decimal :HST

      t.timestamps
    end
  end
end
