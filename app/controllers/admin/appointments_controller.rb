class Admin::AppointmentsController < Admin::AdminController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to admin_appointments_path, notice: I18n.t('register_created') }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to admin_appointments_path, notice: I18n.t('register_updated') }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to admin_appointments_url, notice: I18n.t('register_destroyed') }
      format.json { head :no_content }
    end
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:dateAppointment, :schedule, :price, :description, :user_id, :clinic_id, :patient_id)
    end
end
