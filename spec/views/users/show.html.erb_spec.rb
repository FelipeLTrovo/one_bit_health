require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :role => :admin,
      :email => "teste@teste.com",
      :password => "teste123",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/admin/)
    expect(rendered).to match(/Name/)
  end
end
