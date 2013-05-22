class AddVideoNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :videoid, :number, :default => '0'
  end
end
