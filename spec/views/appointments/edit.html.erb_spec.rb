require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :user => nil,
      :title => "MyString",
      :description => "MyString",
      :professional => "MyString"
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[user_id]"

      assert_select "input[name=?]", "appointment[title]"

      assert_select "input[name=?]", "appointment[description]"

      assert_select "input[name=?]", "appointment[professional]"
    end
  end
end
