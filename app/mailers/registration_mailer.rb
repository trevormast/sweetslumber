class RegistrationMailer < ApplicationMailer
  add_template_helper(WorkshopsHelper)

  def send_homework(registration)
    @user = registration.user
    @workshop = registration.workshop

    mail(to: @user.email, subject: 'Welcome to Sweet Slumber!')
  end
end
