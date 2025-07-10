class MakeLikesPolymorphic < ActiveRecord::Migration[8.0]
  def change
    change_column :likes, :post_id, :integer, null: true
  end
end
