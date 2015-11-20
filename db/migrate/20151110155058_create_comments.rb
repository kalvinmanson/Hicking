class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :place, index: true
      t.text :content
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :places
  end
end
