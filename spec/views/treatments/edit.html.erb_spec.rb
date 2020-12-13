require 'rails_helper'

RSpec.describe "treatments/edit", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      user: create(:user),
      title: "MyString",
      description: "MyText",
      date: "2020-12-10 16:57:15",
      local: "MyString",
      kind: :medicamento
    ))
  end

  it "renders the edit treatment form" do
    render

    assert_select "form[action=?][method=?]", treatment_path(@treatment), "post" do

      assert_select "input[name=?]", "treatment[title]"

      assert_select "textarea[name=?]", "treatment[description]"

      assert_select "input[name=?]", "treatment[local]"

      assert_select "select[name=?]", "treatment[kind]"

    end
  end
end
