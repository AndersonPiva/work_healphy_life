class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # GET /diets
  # GET /diets.json
  def index
    @diets_for_user = []

    Diet.all.each do |diet|
      if diet.patient.user.id == current_user.id
        @diets_for_user << diet
      end
    end
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)
    @diet.duration = @diet.dateEnd - @diet.dateStart
    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: @diet }
      else
        format.html { render :new }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { render :show, status: :ok, location: @diet }
      else
        format.html { render :edit }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_params
      params.require(:diet).permit(:id, :dateStart, :dateEnd, :duration, :totalCalories, :kind, :patient_id, meals_attributes: [:id, :name, :time, :totalCalories, :description, :_destroy])
    end
end
