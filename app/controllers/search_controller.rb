class SearchController < ApplicationController
  skip_load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:title].present?
      @treatments = current_user.treatments.where("treatments.title LIKE ?", "%#{params[:title]}%")
      @exams = current_user.exams.where("exams.title LIKE ?", "%#{params[:title]}%")
      @appointments = current_user.appointments.where("appointments.title LIKE ?", "%#{params[:title]}%")
    end
  end
end
