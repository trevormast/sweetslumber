require 'rails_helper'

RSpec.describe "workshops/index", type: :view do
  before(:each) do
    assign(:workshops, [
      Workshop.create!(
        :type => "Type",
        :limit => 2
      ),
      Workshop.create!(
        :type => "Type",
        :limit => 2
      )
    ])
  end

  it "renders a list of workshops" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
