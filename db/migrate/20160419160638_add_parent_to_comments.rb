class AddParentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent, :reference
  end
end
