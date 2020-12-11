require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :user => nil,
        :title => "Title",
        :description => "Description",
        :professional => "Professional"
      ),
      Appointment.create!(
        :user => nil,
        :title => "Title",
        :description => "Description",
        :professional => "Professional"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Professional".to_s, :count => 2
  end
end
