class Admin::RealizationsController < Admin::AdminController
  before_action :set_realization, only: [:show, :edit, :update, :destroy]


  def index
    @realizations_for_user = []

    Realization.all.each do |realization|
      if realization.patient.user.id == current_user.id
        @realizations_for_user << realization
      end
    end
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

end
