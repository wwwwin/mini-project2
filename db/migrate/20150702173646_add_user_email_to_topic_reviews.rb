class AddUserEmailToTopicReviews < ActiveRecord::Migration
  def change

    add_column :reviews, :email, :string

    add_index :reviews, :email
  end
end
