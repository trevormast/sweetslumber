class RegistrationMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/notifier/welcome
  def send_homework
    @registration = Registration.first
    RegistrationMailer.send_homework(@registration)
  end
end
