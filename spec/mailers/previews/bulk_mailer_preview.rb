# Preview all emails at http://localhost:3000/rails/mailers/bulk_mailer
class BulkMailerPreview < ActionMailer::Preview

  def send_bulk
    @recipients = ['user@web.com', 'otheruser@net.io']
    @subject = "Hello Class"
    @body = "Hello  that was a tab.
    This is a newline.               Those were a ton of spaces."

    BulkMailer.send_bulk(@recipients, @subject, @body)
  end
end
