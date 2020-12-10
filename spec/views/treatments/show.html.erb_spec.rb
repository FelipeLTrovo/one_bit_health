require 'rails_helper'

RSpec.describe "treatments/show", type: :view do
  before(:each) do
    @treatment = assign(:treatment, Treatment.create!(
      title: "Title",
      description: "MyText",
      local: "Local",
      kind: 2,
      appointment: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
