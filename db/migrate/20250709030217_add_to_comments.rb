class AddToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :parent_id, :integer, null: true
  end
end
