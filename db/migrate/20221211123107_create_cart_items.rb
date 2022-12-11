class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :id, null: false
      t.integer :amount, null: false
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"
      t.timestamps
    end
  end
end
