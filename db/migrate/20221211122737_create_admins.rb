class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
    t.integer :id
    t.string :email
    t.string :encrypted_password
    t.datetime :created_at, default: "now"
    t.datetime :updated_at, default: "now"

      t.timestamps
    end
  end
end
