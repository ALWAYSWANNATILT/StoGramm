class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :follows, foreign_key: "follower_id", dependent: :destroy
  has_many :revfollows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :follows, source: :followed
  has_many :followers, through: :revfollows, source: :follower



  def following?(other_user)
    follows.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    follows.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    follows.find_by(followed_id: other_user.id).destroy
  end



  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_mail
  def send_welcome_mail
    Mailer.welcome_mail(self).deliver
  end

end
