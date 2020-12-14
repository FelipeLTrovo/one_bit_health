class SearchController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:title].present?
      @treatments = Treatment.where("treatments.title LIKE ?", "%#{params[:title]}%")
      @exams = Exam.where("exams.title LIKE ?", "%#{params[:title]}%")
      @appointments = Appointment.where("appointments.title LIKE ?", "%#{params[:title]}%")
    end
  end
end
