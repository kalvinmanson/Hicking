class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :user, index: true
      t.references :city, index: true
      t.string :name
      t.string :slug
      t.text :content
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :places, :users
    add_foreign_key :places, :cities
  end
end
