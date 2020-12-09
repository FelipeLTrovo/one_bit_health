require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :user => nil,
      :title => "MyString",
      :description => "MyString",
      :professional => "MyString"
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input[name=?]", "appointment[user_id]"

      assert_select "input[name=?]", "appointment[title]"

      assert_select "input[name=?]", "appointment[description]"

      assert_select "input[name=?]", "appointment[professional]"
    end
  end
end
