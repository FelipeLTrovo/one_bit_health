require 'rails_helper'

RSpec.describe "treatments/index", type: :view do
  before(:each) do
    assign(:treatments, [
      Treatment.create!(
        title: "Title",
        description: "MyText",
        date: "2020-12-10 16:57:15",
        local: "Local",
        kind: 2
      ),
      Treatment.create!(
        title: "Title",
        description: "MyText",
        date: "2020-12-10 16:57:15",
        local: "Local",
        kind: 2
      )
    ])
  end

  it "renders a list of treatments" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Local".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
