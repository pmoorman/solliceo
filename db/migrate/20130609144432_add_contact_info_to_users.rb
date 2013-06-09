class AddContactInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :string, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
    add_column :users, :residence, :string
  end
end
