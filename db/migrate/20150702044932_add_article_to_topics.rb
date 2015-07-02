class AddArticleToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :article, :text
  end
end
