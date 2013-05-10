class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.string :company
      t.string :vacancy

      t.timestamps
    end
  end
end
