require 'rails_helper'

RSpec.describe "treatments/index", type: :view do
  before(:each) do
    http_login
    assign(:treatments, [
      Treatment.create!(
        user: create(:user, name:"Username"),
        title: "Title",
        description: "MyText",
        date: "2020-12-10 16:57:15",
        local: "Local",
        kind: :terapia
      ),
      Treatment.create!(
        user: create(:user, name:"Username"),
        title: "Title",
        description: "MyText",
        date: "2020-12-10 16:57:15",
        local: "Local",
        kind: :terapia
      )
    ])
  end

  it "renders a list of treatments" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Local".to_s, count: 2
  end
end
