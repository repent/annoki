class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.belongs_to :text, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
