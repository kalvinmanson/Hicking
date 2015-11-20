class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.references :place, index: true
      t.references :user, index: true
      t.references :option, index: true
      t.string :name
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :attributes, :places
    add_foreign_key :attributes, :users
    add_foreign_key :attributes, :options
  end
end
