require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :role => :admin,
      :email => "teste@teste.com",
      :password => "teste123",
      :name => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[name]"
    end
  end
end
