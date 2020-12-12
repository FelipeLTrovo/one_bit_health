require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        content: "Content"
      ),
      Tag.create!(
        content: "Content"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", text: "Content".to_s, count: 2
  end
end
