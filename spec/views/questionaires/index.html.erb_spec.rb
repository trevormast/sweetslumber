require 'rails_helper'

RSpec.describe "questionaires/index", type: :view do
  before(:each) do
    assign(:questionaires, [
      Questionaire.create!(
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
      ),
      Questionaire.create!(
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
      )
    ])
  end

  it "renders a list of questionaires" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Nap Location".to_s, :count => 2
    assert_select "tr>td", :text => "Night Location".to_s, :count => 2
    assert_select "tr>td", :text => "Desired Sleep Location".to_s, :count => 2
    assert_select "tr>td", :text => "Nap Routine".to_s, :count => 2
    assert_select "tr>td", :text => "Night Routine".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Sleep Obstacle".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Sleep Goal".to_s, :count => 2
    assert_select "tr>td", :text => "Referred By".to_s, :count => 2
  end
end
