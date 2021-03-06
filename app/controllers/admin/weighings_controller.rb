class Admin::WeighingsController < Admin::AdminController
  before_action :set_weighing, only: [:show, :edit, :update, :destroy]

  def index
    @weighings_foruser = []
    weighings_all = Weighing.all
    weighings_all.each do |weighing|
      if weighing.patient.user.id == current_user.id
        @weighings_foruser << weighing
      end

    @weighings_foruser
    end
  end

  def show
  end

  def new
    @weighing = Weighing.new
  end

  def edit
  end

  def create
    @weighing = Weighing.new(weighing_params)

    respond_to do |format|
      if @weighing.save
        format.html { redirect_to admin_weighings_path, notice: I18n.t('register_created') }
      else
        format.html { render :new }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @weighing.update(weighing_params)
        format.html { redirect_to admin_weighings_path, notice: I18n.t('register_updated') }
      else
        format.html { render :edit }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weighing.destroy
    respond_to do |format|
      format.html { redirect_to admin_weighings_url, notice: I18n.t('register_destroyed') }
      format.json { head :no_content }
    end
  end

  private

    def set_weighing
      @weighing = Weighing.find(params[:id])
    end

    def weighing_params
      params.require(:weighing).permit(:dateWeighing, :weight, :patient_id)
    end
end
