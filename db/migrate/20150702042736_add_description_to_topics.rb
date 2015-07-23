class AddDescriptionToTopics < ActiveRecord::Migration
  def change
    add_column :Topics, :description, :text
  end
end
