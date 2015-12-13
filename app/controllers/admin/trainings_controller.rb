class Admin::TrainingsController < Admin::AdminController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  def index
    @trainings_for_user = []

    Training.all.each do |training|
      if training.patient.user.id == current_user.id
        @trainings_for_user << training
      end
    end
  end

  def show
  end

  def new
    @training = Training.new
  end

  def edit
  end

  def create
    @training = Training.new(training_params)
    respond_to do |format|
      if @training.save
        format.html { redirect_to admin_trainings_path, notice: t('register_created') }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to admin_trainings_path, notice: I18n.t('register_updated') }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to admin_trainings_url, notice: I18.t('register_destroyed') }
      format.json { head :no_content }
    end
  end

  private

    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:id, :weekDay, :muscularGroups, :description, :dateStart, :dateEnd, :duration, :patient_id, exercises_attributes: [:id, :name, :description, :series, :repeats, :duration, :_destroy])
    end
end
