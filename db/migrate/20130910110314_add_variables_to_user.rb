class AddVariablesToUser < ActiveRecord::Migration
  def change
    add_column :users, :about_title, :string
    add_column :users, :about, :string
  end
end
