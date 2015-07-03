class AddColumnToCategory < ActiveRecord::Migration
  def change

    add_column :categories, :name, :integer
    add_index :categories, :name
  end
end
