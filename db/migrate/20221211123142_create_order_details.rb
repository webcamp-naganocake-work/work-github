class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :order_detail_id, null: false
      t.integer :amount, null: false
      t.integer :price_including_tax, null: false
      t.integer :making_status, null: false, default: "0"
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"

      t.timestamps
    end
  end
end
