class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :addressee, null: false
      t.integer :postage, null: false
      t.integer :total, null: false
      t.integer :payment_method, null: false, default: "0"
      t.integer :order_status, null: false, default: "0"
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"
      
      t.timestamps
    end
  end
end
