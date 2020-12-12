class HomeController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:about]

  def index
    @appointments = Appointment.order(:created_at).limit(3).reverse()
    @exams = Exam.order(:created_at).limit(3).reverse()
    @treatments = Treatment.order(:created_at).limit(3).reverse()
  end

  def about
    render layout: "devise"
  end
end
