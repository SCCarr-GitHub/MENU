class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.string :phone_number
      t.string :name
      t.string :category
      t.time :opening_time
      t.time :closing_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
