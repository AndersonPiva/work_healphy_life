class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
    respond_to do |format|
     format.html

     format.pdf { render pdf: "dieta",
       footer: { center: "[page] of [topage]" }
     }
    end
  end

  private

    def set_diet
      @diet = Diet.find(params[:id])
    end

    def diet_params
      params.require(:diet).permit(:id, :dateStart, :dateEnd, :duration, :totalCalories, :kind, :patient_id, meals_attributes: [:id, :name, :time, :totalCalories, :description, :_destroy])
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: I18n.t('sign_in_to_continue')
      end
    end
end
