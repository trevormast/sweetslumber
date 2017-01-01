class RegistrationMailer < ApplicationMailer
  add_template_helper(WorkshopsHelper)
  add_template_helper(MailerHelper)

  def send_homework(registration)
    @registration  = registration
    @user = registration.user
    @workshop = registration.workshop

    mail(to: @user.email, subject: 'Welcome to Sweet Slumber!')
  end
end
