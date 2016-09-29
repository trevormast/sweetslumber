require 'rails_helper'

RSpec.describe "questionaires/edit", type: :view do
  before(:each) do
    @questionaire = assign(:questionaire, Questionaire.create!(
      :baby_name => "MyText",
      :nap_location => "MyString",
      :night_location => "MyString",
      :desired_sleep_location => "MyString",
      :nap_routine => "MyString",
      :night_routine => "MyString",
      :naps_per_day => 1,
      :sleep_obstacle => "MyString",
      :nightwakings => 1,
      :sleep_goal => "MyString",
      :referred_by => "MyString"
    ))
  end

  it "renders the edit questionaire form" do
    render

    assert_select "form[action=?][method=?]", questionaire_path(@questionaire), "post" do

      assert_select "textarea#questionaire_baby_name[name=?]", "questionaire[baby_name]"

      assert_select "input#questionaire_nap_location[name=?]", "questionaire[nap_location]"

      assert_select "input#questionaire_night_location[name=?]", "questionaire[night_location]"

      assert_select "input#questionaire_desired_sleep_location[name=?]", "questionaire[desired_sleep_location]"

      assert_select "input#questionaire_nap_routine[name=?]", "questionaire[nap_routine]"

      assert_select "input#questionaire_night_routine[name=?]", "questionaire[night_routine]"

      assert_select "input#questionaire_naps_per_day[name=?]", "questionaire[naps_per_day]"

      assert_select "input#questionaire_sleep_obstacle[name=?]", "questionaire[sleep_obstacle]"

      assert_select "input#questionaire_nightwakings[name=?]", "questionaire[nightwakings]"

      assert_select "input#questionaire_sleep_goal[name=?]", "questionaire[sleep_goal]"

      assert_select "input#questionaire_referred_by[name=?]", "questionaire[referred_by]"
    end
  end
end
