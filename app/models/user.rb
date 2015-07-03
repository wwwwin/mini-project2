class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :topics #複數
  belongs_to :reviews #複數

  def short_name
    self.email.split("@").first
  end
end
