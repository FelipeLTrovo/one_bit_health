class HomeController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:about]

  def index
  end

  def about
    render layout: "devise"
  end
end
