require 'rails_helper'

RSpec.describe "treatments/show", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      title: "Title",
      description: "MyText",
      date: "2020-12-10 16:57:15",
      local: "Local",
      kind: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(/2/)
  end
end
