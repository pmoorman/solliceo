class AddImageRemoteUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_remote_url, :string
  end
end
