class AddParentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :reference
  end
end
