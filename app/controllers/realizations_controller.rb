class RealizationsController < ApplicationController
  before_action :set_realization, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # GET /realizations
  # GET /realizations.json
  def index
    @realizations_for_user = []

    Realization.all.each do |realization|
      if realization.patient.user.id == current_user.id
        @realizations_for_user << realization
      end
    end
  end

  # GET /realizations/1
  # GET /realizations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realization
      @realization = Realization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realization_params
      params.require(:realization).permit(:date, :status, :observation, :training_id, :patient_id)
    end
end
