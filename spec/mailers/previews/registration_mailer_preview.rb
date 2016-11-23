class RegistrationMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/notifier/welcome
  def send_homework
    @user = User.where(admin: false).first
    RegistrationMailer.send_homework(@user)
  end
end
