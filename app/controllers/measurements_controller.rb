class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
  end

  def new
    @measurement = Measurement.new
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.patient_id = current_patient.id
    @recent_activity = RecentActivity.new date: Date.today, shedule: Time.now, patient_id: current_patient.id, user_id: current_patient.user_id, description: "Cadastrou uma nova medida"
    @recent_activity.measurement = @measurement
    @recent_activity.save
    respond_to do |format|
      if @measurement.save
        format.html { redirect_to measurements_path, notice: I18n.t('register_created') }
      else
        format.html { render :new }
        @recent_activity.destroy
      end
    end
  end

  def update
    @recent_activity = RecentActivity.new date: Date.today, shedule: Time.now, patient_id: current_patient.id, user_id: current_patient.user_id, description: "Editou uma medida"
    @recent_activity.measurement = @measurement
    @recent_activity.save
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to measurements_path, notice: I18n.t('register_updated') }
      else
        format.html { render :edit }
        @recent_activity.destroy
      end
    end
  end

  def destroy
    @measurement.destroy
    @recent_activity = RecentActivity.new date: Date.today, shedule: Time.now, patient_id: current_patient.id, user_id: current_patient.user_id, description: "Excluiu uma medida"
    @recent_activity.save
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: I18n.t('register_destroyed') }
      format.json { head :no_content }
    end
  end

  private

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:date, :nameMeasure, :size, :patient_id)
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: I18n.t('sign_in_to_continue')
      end
    end
end
