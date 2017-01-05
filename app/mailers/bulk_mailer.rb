class BulkMailer < ApplicationMailer
  def send_bulk(recipients, subject, body)
    @body = body

    mail(to: recipients, subject: subject)
  end
end
