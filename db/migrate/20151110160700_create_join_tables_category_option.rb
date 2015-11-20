class CreateJoinTablesCategoryOption < ActiveRecord::Migration
  def change
    create_join_table :categories, :options do |t|
      # t.index [:category_id, :option_id]
      # t.index [:option_id, :category_id]
    end
  end
end
