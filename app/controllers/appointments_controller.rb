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

    @aux=0

    @appointments_for_user = []
    Appointment.all.each do |appointment|
      if appointment.patient.user_id == current_patient.user_id
        @appointments_for_user << appointment
      end
    end

    @appointments_for_user.each do |appointment|
      if appointment.dateAppointment == @appointment.dateAppointment
        @aux = 1
      end
    end

    respond_to do |format|
      if @aux == 0
        @appointment.save
        format.html { redirect_to @appointment }
        format.json { render :show, status: :created, location: @appointment }
      else
        flash[:notice] = "Data/Horário indisponíveis, Tente novamente"
        format.html { render :new}
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
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
        redirect_to new_patient_session_path, notice: 'Logue para continuar'
      end
    end
end
