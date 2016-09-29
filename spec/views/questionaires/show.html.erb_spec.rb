require 'rails_helper'

RSpec.describe "questionaires/show", type: :view do
  before(:each) do
    @questionaire = assign(:questionaire, Questionaire.create!(
      :baby_name => "MyText",
      :nap_location => "Nap Location",
      :night_location => "Night Location",
      :desired_sleep_location => "Desired Sleep Location",
      :nap_routine => "Nap Routine",
      :night_routine => "Night Routine",
      :naps_per_day => 2,
      :sleep_obstacle => "Sleep Obstacle",
      :nightwakings => 3,
      :sleep_goal => "Sleep Goal",
      :referred_by => "Referred By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Nap Location/)
    expect(rendered).to match(/Night Location/)
    expect(rendered).to match(/Desired Sleep Location/)
    expect(rendered).to match(/Nap Routine/)
    expect(rendered).to match(/Night Routine/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Sleep Obstacle/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Sleep Goal/)
    expect(rendered).to match(/Referred By/)
  end
end
