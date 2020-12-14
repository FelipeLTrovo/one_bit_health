class HomeController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:about]

  def index
    @appointments = current_user.appointments.order(:created_at).limit(3).reverse()
    @exams = current_user.exams.order(:created_at).limit(3).reverse()
    @treatments = current_user.treatments.order(:created_at).limit(3).reverse()
  end

  def about
    render layout: "devise"
  end
end
