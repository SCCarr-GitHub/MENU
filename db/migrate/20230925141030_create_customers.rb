class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :address
      t.string :phone_number
      t.string :name
      t.string :surname
      t.string :area
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
