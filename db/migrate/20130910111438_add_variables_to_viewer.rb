class AddVariablesToViewer < ActiveRecord::Migration
  def change
    add_column :viewers, :summary_title, :string
    add_column :viewers, :summary, :string
    add_column :viewers, :title, :string
    add_column :viewers, :tagline, :string
  end
end
