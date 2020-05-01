class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  after_create :send_welcome_mail
  def send_welcome_mail
    Mailer.welcome_mail(self).deliver
  end

end
