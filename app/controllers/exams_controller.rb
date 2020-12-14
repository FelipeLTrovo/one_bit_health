class ExamsController < ApplicationController
  include Permissions
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :initial_collections, only: [:show, :new, :edit, :create, :update]

  # GET /exams
  # GET /exams.json
  def index
    if current_user.admin?
      @exams = Exam.all
    else
      professional_list = Exam.where(user: @list).pluck(:id)
      user_list = Exam.where(user: current_user).pluck(:id)
      @exams = Exam.where(id: [professional_list, user_list].flatten)
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new(user: current_user)
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)
    @exam.user = current_user

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      professional_list = Exam.where(user: @list).pluck(:id)
      user_list = Exam.where(user: current_user).pluck(:id)
      exams = Exam.where(id: [professional_list, user_list].flatten)
      if exams.blank?
        @exam = nil
        redirect_to root_url, notice: "Registro não encontrado"
      else
        @exam = Exam.find(params[:id])
      end
    end

    def initial_collections
      @tags = Tag.all.order(:content)
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:user_id, :title, :description, :exam_date, :place, files: [], :tag_ids=>[])
    end
end
