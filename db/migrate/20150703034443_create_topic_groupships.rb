class CreateTopicGroupships < ActiveRecord::Migration
  def change
    create_table :topic_groupships do |t|
      t.integer :topic_id
      t.integer :select_id

      t.timestamps null: false
    end
  end
end
