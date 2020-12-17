class SearchController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:title].present?
      if current_user.admin?
        @treatments = Treatment.where("treatments.title LIKE ?", "%#{params[:title]}%")
        @exams = Exam.where("exams.title LIKE ?", "%#{params[:title]}%")
        @appointments = Appointment.where("appointments.title LIKE ?", "%#{params[:title]}%")
      else
        @treatments = current_user.treatments.where("treatments.title LIKE ?", "%#{params[:title]}%")
        @exams = current_user.exams.where("exams.title LIKE ?", "%#{params[:title]}%")
        @appointments = current_user.appointments.where("appointments.title LIKE ?", "%#{params[:title]}%")
      end
    end
  end
end
