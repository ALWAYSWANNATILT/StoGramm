class User < ApplicationRecord
  has_many :posts, dependent: :destroy

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
