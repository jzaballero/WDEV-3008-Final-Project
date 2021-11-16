class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.decimal :PST_total
      t.decimal :GST_total
      t.decimal :HST_total
      t.decimal :subtotal

      t.timestamps
    end
  end
end
