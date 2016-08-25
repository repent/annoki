class AddLocationToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :location, :integer
  end
end
