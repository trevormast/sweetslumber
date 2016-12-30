# require 'rails_helper'
# require 'registration_feature_spec_helper'


# # https://stripe.com/docs/testing#cards for testing errors
# RSpec.describe "the registration process", :type => :feature, :js => :true do
#   let(:user) { FactoryGirl.build(:user) }
#   let(:workshop) { FactoryGirl.create(:workshop) }

#   before :each do
#     sign_up user
#     visit "/workshops/#{workshop.id}/registrations/new"
#   end

#   context 'with valid credit card' do
#     it "registers a new class" do
#       submit_registration_form
#       wait_for_ajax

#       expect(page).to have_content 'Registration was successful'
#     end
#   end

#   context 'with invalid credit card number' do
#     it 'does not register a new class' do

#       submit_registration_form(42424242)
#       wait_for_ajax

#       expect(page).to have_content 'Your card number is incorrect.'
#     end
#   end

#   context 'with invalid credit card expiry' do
#     it 'does not register a new class' do

#       submit_registration_form(4242424242424242, 2016)
#       wait_for_ajax

#       expect(page).to have_content "Your card's expiration month is invalid."
#     end
#   end

#   context 'with invalid credit card security code' do
#     it 'does not register a new class' do

#       submit_registration_form(4242424242424242, 2020, 1)
#       wait_for_ajax

#       expect(page).to have_content "Your card's security code is invalid."

#     end
#   end
# end


