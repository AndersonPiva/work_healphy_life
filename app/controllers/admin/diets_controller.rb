class Admin::DietsController < Admin::AdminController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  def index
    @diets_for_user = []

    Diet.all.each do |diet|
      if diet.patient.user.id == current_user.id
        @diets_for_user << diet
      end
    end
  end

  def show
  end

  def new
    @diet = Diet.new
  end

  def edit
  end

  def create
    @diet = Diet.new(diet_params)
    @diet.duration = @diet.dateEnd - @diet.dateStart
    respond_to do |format|
      if @diet.save
        format.html { redirect_to admin_diets_path, notice: 'Diet was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to admin_diets_path, notice: 'Diet was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to admin_diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_diet
      @diet = Diet.find(params[:id])
    end

    def diet_params
      params.require(:diet).permit(:id, :dateStart, :dateEnd, :duration, :totalCalories, :kind, :patient_id, meals_attributes: [:id, :name, :time, :totalCalories, :description, :_destroy])
    end
end
