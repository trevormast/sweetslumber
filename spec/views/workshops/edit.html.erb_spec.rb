require 'rails_helper'

RSpec.describe "workshops/edit", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!(
      :subject => "",
      :limit => 1
    ))
  end

  it "renders the edit workshop form" do
    render

    assert_select "form[action=?][method=?]", workshop_path(@workshop), "post" do

      assert_select "input#workshop_subject[name=?]", "workshop[subject]"

      assert_select "input#workshop_limit[name=?]", "workshop[limit]"
    end
  end
end
