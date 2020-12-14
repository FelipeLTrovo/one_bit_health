class SharedsController < ApplicationController

  def index
    @shareds = current_user.shareds
  end

  def new
    @shared = Shared.new
  end

  def create
    @shared = Shared.new(shared_params)
    professional = User.where(email: params[:shared][:professional_id])
    if !professional.present?
      flash[:danger] = "Não existem profissionais cadastrados."
      redirect_to (new_shared_path)
      return
    end
    @shared.professional_id = professional.id
    @shared.user_id = current_user.id



    respond_to do |format|
      if @shared.save
        format.html { redirect_to @shared, notice: 'Shared was successfully created.' }
        format.json { render :show, status: :created, location: @shared }
      else
        format.html { render :new }
        format.json { render json: @shared.errors, status: :unprocessable_entity }
      end
    end
  end


  private 

  def shared_params
    params.require(:shared).permit(:user_id, :professional_id, :duedate, :created_at)
  end


end
