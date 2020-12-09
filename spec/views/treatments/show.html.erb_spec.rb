require 'rails_helper'

RSpec.describe "treatments/show", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      title: "Title",
      description: "MyText",
      local: "Local",
      kind: "",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
