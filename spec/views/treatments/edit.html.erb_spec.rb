require 'rails_helper'

RSpec.describe "treatments/edit", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      title: "MyString",
      description: "MyText",
      local: "MyString",
      kind: 1,
      appointment: nil
    ))
  end

  it "renders the edit treatment form" do
    render

    assert_select "form[action=?][method=?]", treatment_path(@treatment), "post" do

      assert_select "input[name=?]", "treatment[title]"

      assert_select "textarea[name=?]", "treatment[description]"

      assert_select "input[name=?]", "treatment[local]"

      assert_select "input[name=?]", "treatment[kind]"

      assert_select "input[name=?]", "treatment[appointment_id]"
    end
  end
end
