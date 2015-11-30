class RealizationsController < ApplicationController
  before_action :set_realization, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
  end

  def new
  @realization = Realization.new
  end

def create
  @realization = Realization.new(realization_params)
  @realization.patient_id = current_patient.id
  @recent_activity = RecentActivity.new date: Date.today, shedule: Time.now, patient_id: current_patient.id, user_id: current_patient.user_id, description: "Cadastrou uma nova realizacao"
  @recent_activity.realization = @realization
  @recent_activity.save
  respond_to do |format|
    if @realization.save
      format.html { redirect_to realizations_path notice: I18n.t('register_created') }
    else
      format.html { render :new }
      @recent_activity.destroy
    end
  end
end

  private

    def set_realization
      @realization = Realization.find(params[:id])
    end

    def realization_params
      params.require(:realization).permit(:date, :status, :observation, :training_id, :patient_id)
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: I18n.t('sign_in_to_continue')
      end
    end
end
