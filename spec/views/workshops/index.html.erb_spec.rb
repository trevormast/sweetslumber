require 'rails_helper'

RSpec.describe "workshops/index", type: :view do
  before(:each) do
    assign(:workshops, [
      Workshop.create!(
        :subject => "Subject",
        :limit => 2
      ),
      Workshop.create!(
        :subject => "Subject",
        :limit => 2
      )
    ])
  end

  it "renders a list of workshops" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
