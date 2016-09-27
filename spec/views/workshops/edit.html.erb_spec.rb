require 'rails_helper'

RSpec.describe "workshops/edit", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!(
      :type => "",
      :limit => 1
    ))
  end

  it "renders the edit workshop form" do
    render

    assert_select "form[action=?][method=?]", workshop_path(@workshop), "post" do

      assert_select "input#workshop_type[name=?]", "workshop[type]"

      assert_select "input#workshop_limit[name=?]", "workshop[limit]"
    end
  end
end
