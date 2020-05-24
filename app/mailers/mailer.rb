class Mailer < ActionMailer::Base
  def welcome_mail(user)
    mail(to: user.email,
         from: "services@gmail.com",
         subject: "Welcome to ПОМОЙКАGRAM",
         body: "You have succesfully registered")
  end
end
