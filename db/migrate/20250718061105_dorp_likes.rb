class DorpLikes < ActiveRecord::Migration[8.0]
  def change
    drop_table :likes, if_exists: true
  end
end
