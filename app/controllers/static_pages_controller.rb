require 'contact.rb'
class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :registered_only, only: :resources

  def home

  end

  def about_class

  end

  def about_teacher

  end

  def resources

  end

  def contact
    @contact_message = ContactMessage.new
  end

  def email_message

    @contact_message = ContactMessage.new(contact_message_params)
    ContactMailer.send_contact_message(@contact_message).deliver_now

    respond_to do |format|
      format.html {redirect_to contact_path, notice: 'Message sent.'}
    end

  end

  private
    def contact_message_params
      params.require(:contact_message).permit(:email, :message)
    end

end
