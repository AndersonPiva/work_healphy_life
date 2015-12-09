class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

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
    @appointment.patient_id = current_patient.id
    @appointment.user_id = current_patient.user_id
    @appointment.clinic_id = current_patient.clinic_id

    @reminder = Reminder.new description: 'Você tem uma consulta agendada para o dia ', patient_id: current_patient.id
    @reminder.appointment = @appointment
    @reminder.save

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_path, notice: I18n.t('register_created') }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new}
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
        @reminder.destroy
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: I18n.t('register_destroyed') }
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

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: I18n.t('sign_in_to_continue')
      end
    end
end
