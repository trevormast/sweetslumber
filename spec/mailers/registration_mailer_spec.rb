require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  describe 'send homework' do
    let(:user) { FactoryGirl.create(:user) }
    let(:workshop) { FactoryGirl.create(:workshop) }
    let(:questionaire) { FactoryGirl.create(:questionaire) }
    let(:registration) {
      FactoryGirl.create(:registration, 
                          user: user,
                          workshop: workshop,
                          questionaire: questionaire)

    }
    let(:homework) { RegistrationMailer.send_homework(registration) }

    it 'sends to the right user' do
      expect(homework.to).to eq(['new@user.com'])
    end

    it 'has the right subject' do
      expect(homework.subject).to eq('Welcome to Sweet Slumber!')
    end

    it 'sends the right location' do
      expect(homework.body).to include(workshop.location.name)
      expect(homework.body).to include(workshop.location.address)
    end

    it 'sends the right time' do
      expect(homework.body).to include("#{workshop.time.strftime("%b %d, %Y")}")
    end

    context 'with 2 month old baby' do
      let(:questionaire) { FactoryGirl.create(:questionaire, baby_dob: workshop.time.months_ago(2)) }
      let(:registration) {
        FactoryGirl.create(:registration, 
                            user: user,
                            workshop: workshop,
                            questionaire: questionaire) 
      }
    

      it 'sends sleep guide for newborns' do
        expect(homework.body).to include("https://www.preciouslittlesleep.com/newborn-baby-sleep-survival-guide")
      end
    end

    context 'with 4 month old baby' do
      let(:questionaire) { FactoryGirl.create(:questionaire, baby_dob: workshop.time.months_ago(4)) }
      let(:registration) {
        FactoryGirl.create(:registration, 
                            user: user,
                            workshop: workshop,
                            questionaire: questionaire) 
      }
    

      it 'sends sleep guide for newborns' do
        expect(homework.body).to include("https://www.preciouslittlesleep.com/3-6-month-baby-sleep-survival-guide")
      end
    end
    context 'with 7 month old baby' do
      let(:questionaire) { FactoryGirl.create(:questionaire, baby_dob: workshop.time.months_ago(7)) }
      let(:registration) {
        FactoryGirl.create(:registration, 
                            user: user,
                            workshop: workshop,
                            questionaire: questionaire) 
      }
    

      it 'sends sleep guide for newborns' do
        expect(homework.body).to include("https://www.preciouslittlesleep.com/6-9-month-baby-sleep-survival-guide")
      end
    end
    context 'with 10 month old baby' do
      let(:questionaire) { FactoryGirl.create(:questionaire, baby_dob: workshop.time.months_ago(10)) }
      let(:registration) {
        FactoryGirl.create(:registration, 
                            user: user,
                            workshop: workshop,
                            questionaire: questionaire) 
      }
    

      it 'sends sleep guide for newborns' do
        expect(homework.body).to include("https://www.preciouslittlesleep.com/9-12-month-baby-sleep-survival-guide")
      end
    end
  end
end


# RSpec.describe Notifications, :type => :mailer do
#   describe "notify" do
#     let(:mail) { Notifications.signup }

#     it "renders the headers" do
#       expect(mail.subject).to eq("Signup")
#       expect(mail.to).to eq(["to@example.org"])
#       expect(mail.from).to eq(["from@example.com"])
#     end

#     it "renders the body" do
#       expect(mail.body.encoded).to match("Hi")
#     end
#   end
# end