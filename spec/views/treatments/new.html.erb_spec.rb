require 'rails_helper'

RSpec.describe "treatments/new", type: :view do
  before(:each) do
    assign(:treatment, Treatment.new(
      title: "MyString",
      description: "MyText",
      local: "MyString",
      kind: 1,
      appointment: nil
    ))
  end

  it "renders new treatment form" do
    render

    assert_select "form[action=?][method=?]", treatments_path, "post" do

      assert_select "input[name=?]", "treatment[title]"

      assert_select "textarea[name=?]", "treatment[description]"

      assert_select "input[name=?]", "treatment[local]"

      assert_select "input[name=?]", "treatment[kind]"

      assert_select "input[name=?]", "treatment[appointment_id]"
    end
  end
end
