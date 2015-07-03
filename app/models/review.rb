class Review < ActiveRecord::Base

  validates_presence_of :comment

  has_many :user #單數

  belongs_to :topic #單數
end
