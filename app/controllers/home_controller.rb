class HomeController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:about]

  def index
    if current_user.admin?
      @appointments = Appointment.order(:created_at).limit(3).reverse()
      @exams = Exam.order(:created_at).limit(3).reverse()
      @treatments = Treatment.order(:created_at).limit(3).reverse()
    else
      @appointments = current_user.appointments.order(:created_at).limit(3).reverse()
      @exams = current_user.exams.order(:created_at).limit(3).reverse()
      @treatments = current_user.treatments.order(:created_at).limit(3).reverse()
    end
  end

  def about
    render layout: "devise"
  end
end
