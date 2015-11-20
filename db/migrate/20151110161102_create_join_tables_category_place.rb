class CreateJoinTablesCategoryPlace < ActiveRecord::Migration
  def change
    create_join_table :categories, :places do |t|
      # t.index [:category_id, :place_id]
      # t.index [:place_id, :category_id]
    end
  end
end
