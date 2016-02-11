class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :city, index: true
      t.string :name
      t.string :slug, unique: true
      t.string :rol
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :users, :cities
  end
end
