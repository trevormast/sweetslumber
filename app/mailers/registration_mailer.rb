class RegistrationMailer < ApplicationMailer
  default from: 'sweetslumberworkshops@gmail.com'

  def send_homework(user)
    mail(to: user.email, subject: 'Welcome to Sweet Slumber!')
  end
end
