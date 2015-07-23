class Review < ActiveRecord::Base

  validates_presence_of :comment

  belongs_to :user #單數

  belongs_to :topic, :counter_cache => true#單數
end
