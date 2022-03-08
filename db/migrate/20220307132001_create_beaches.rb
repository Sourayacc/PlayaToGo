class CreateBeaches < ActiveRecord::Migration[6.1]
  def change
    create_table :beaches do |t|
      t.string :address
      t.string :title
      t.string :price
      t.text :description
      t.boolean :lunch, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
