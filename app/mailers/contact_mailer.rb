class ContactMailer < ApplicationMailer

  def send_contact_message(contact_message)
    @email = contact_message.email
    @message = contact_message.message
    mail(to: Rails.application.secrets.GMAIL_USERNAME,
         subject: 'New message from sweetslumberworkshops.com')
  end
end
