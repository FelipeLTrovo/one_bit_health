require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :role => :admin,
        :email => "teste@teste.com",
        :password => "teste123",
        :name => "Name"
      ),
      User.create!(
        :role => :admin,
        :email => "teste1@teste.com",
        :password => "teste123",
        :name => "Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
