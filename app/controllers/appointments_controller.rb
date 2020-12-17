class AppointmentsController < ApplicationController
  include Permissions
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :initial_collections, only: [:show, :new, :edit, :create, :update]

  # GET /appointments
  # GET /appointments.json
  def index
    if current_user.admin?
      @appointments = Appointment.all
    else
      professional_list = Appointment.where(user: @list).pluck(:id)
      user_list = Appointment.where(user: current_user).pluck(:id)
      @appointments = Appointment.where(id: [professional_list, user_list].flatten)
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new(user: current_user)
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = current_user.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      professional_list = Appointment.where(user: @list).pluck(:id)
      user_list = Appointment.where(user: current_user).pluck(:id)
      appointments = Appointment.where(id: [professional_list, user_list].flatten)
      if appointments.blank?
        @appointment = nil
        redirect_to root_url, notice: "Registro não encontrado"
      else
        @appointment = Appointment.find(params[:id])
      end
    end

    def initial_collections
      @tags = Tag.all.order(:content)
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:user_id, :title, :description, :professional, :date, files: [], :tag_ids=>[])
    end
end
