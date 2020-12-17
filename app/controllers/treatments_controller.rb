class TreatmentsController < ApplicationController
  include Permissions
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  before_action :initial_collections, only: [:show, :new, :edit, :create, :update]

  # GET /treatments
  # GET /treatments.json
  def index
    if current_user.admin?
      @treatments = Treatment.all
    else
      professional_list = Treatment.where(user: @list).pluck(:id)
      user_list = Treatment.where(user: current_user).pluck(:id)
      @treatments = Treatment.where(id: [professional_list, user_list].flatten)
    end
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = current_user.treatments.new(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'Treatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      professional_list = Treatment.where(user: @list).pluck(:id)
      user_list = Treatment.where(user: current_user).pluck(:id)
      treatments = Treatment.where(id: [professional_list, user_list].flatten)
      if treatments.blank?
        @treatment = nil
        redirect_to root_url, notice: "Registro não encontrado"
      else
        @treatment = Treatment.find(params[:id])
      end
    end

    def initial_collections
      @tags = Tag.all.order(:content)
    end

    # Only allow a list of trusted parameters through.
    def treatment_params
      params.require(:treatment).permit(:title, :description, :date, :local, :kind, files: [], :tag_ids=>[])
    end
end
