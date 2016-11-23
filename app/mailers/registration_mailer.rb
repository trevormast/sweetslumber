class RegistrationMailer < ApplicationMailer
  def send_homework(user)
    mail(to: user.email, from: 'sweetslumberworkshops@gmail.com', subject: 'Welcome to Sweet Slumber!')
  end
end
