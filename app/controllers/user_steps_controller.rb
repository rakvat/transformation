class UserStepsController < ApplicationController
  before_action :set_user_step, only: [:show, :edit, :update, :destroy]

  # GET /user_steps
  # GET /user_steps.json
  def index
    @user_steps = UserStep.all
  end

  # GET /user_steps/1
  # GET /user_steps/1.json
  def show
  end

  # GET /user_steps/new
  def new
    @user_step = UserStep.new
  end

  # GET /user_steps/1/edit
  def edit
  end

  # POST /user_steps
  # POST /user_steps.json
  def create
    @user_step = UserStep.new(user_step_params)

    respond_to do |format|
      if @user_step.save
        format.html { redirect_to @user_step, notice: 'User step was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_step }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_steps/1
  # PATCH/PUT /user_steps/1.json
  def update
    respond_to do |format|
      if @user_step.update(user_step_params)
        format.html { redirect_to @user_step, notice: 'User step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_steps/1
  # DELETE /user_steps/1.json
  def destroy
    @user_step.destroy
    respond_to do |format|
      format.html { redirect_to user_steps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_step
      @user_step = UserStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_step_params
      params.require(:user_step).permit(:user_id, :step_id)
    end
end
