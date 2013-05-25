class AddVideoNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :videoid, :integer, :default => 0
  end
end
