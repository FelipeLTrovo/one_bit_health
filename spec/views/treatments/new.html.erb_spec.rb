require 'rails_helper'

RSpec.describe "treatments/new", type: :view do
  before(:each) do
    assign(:treatment, Treatment.new(
      title: "MyString",
      description: "MyText",
      date: "2020-12-10 16:57:15",
      local: "MyString",
      kind: 1,
    ))
  end

  it "renders new treatment form" do
    render

    assert_select "form[action=?][method=?]", treatments_path, "post" do

      assert_select "input[name=?]", "treatment[title]"

      assert_select "textarea[name=?]", "treatment[description]"
      
      assert_select "input[name=?]", "treatment[local]"

      assert_select "input[name=?]", "treatment[kind]"

    end
  end
end
