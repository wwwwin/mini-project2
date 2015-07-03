class Topic < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :article



  has_many :reviews #複數
  belongs_to :category
  belongs_to :user
end
