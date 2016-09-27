require 'rails_helper'

RSpec.describe "workshops/show", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!(
      :type => "Type",
      :limit => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
  end
end
