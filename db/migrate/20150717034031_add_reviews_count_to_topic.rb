class AddReviewsCountToTopic < ActiveRecord::Migration
    def change
    add_column :topics, :reviews_count, :integer, :default => 0

    Topic.pluck(:id).each do |i|
      Topic.reset_counters(i, :reviews) # 全部重算一次
    end
  end
end
