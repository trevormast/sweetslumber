require 'rails_helper'

RSpec.describe "workshops/new", type: :view do
  before(:each) do
    assign(:workshop, Workshop.new(
      :subject => "",
      :limit => 1
    ))
  end

  it "renders new workshop form" do
    render

    assert_select "form[action=?][method=?]", workshops_path, "post" do

      assert_select "input#workshop_subject[name=?]", "workshop[subject]"

      assert_select "input#workshop_limit[name=?]", "workshop[limit]"
    end
  end
end
