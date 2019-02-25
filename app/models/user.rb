class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  attachment :profile_image

  has_many :reviews, dependent: :destroy

  has_many :products, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :informations

  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :introduction, length: { maximum: 1000 }

end

class ActiveModel::Errors
  def full_messages
    map do |attribute, message|
      msg = full_message(attribute, message)
      if msg == 'User1商品につき1レビューとなっております。'
        message
      else
        msg
      end
    end
  end
end