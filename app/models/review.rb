class Review < ActiveRecord::Base

  validates_presence_of :comment
  belongs_to :topic #單數
end