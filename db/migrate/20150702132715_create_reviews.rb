class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :topic_id

      t.timestamps null: false
    end

    add_index :reviews, :topic_id
  end
end
