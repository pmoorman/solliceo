class AddUserIdToViewers < ActiveRecord::Migration
  def change
    add_column :viewers, :user_id, :integer
    add_index :viewers, :user_id
  end
end
