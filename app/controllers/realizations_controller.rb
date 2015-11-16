class RealizationsController < ApplicationController
  before_action :set_realization, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index
  
  end

  def show
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
        redirect_to new_patient_session_path, notice: 'Logue para continuar'
      end
    end
end
