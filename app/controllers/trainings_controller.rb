class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
    respond_to do |format|
      format.html

      format.pdf { render pdf: "treino",
        footer: { center: "[page] of [topage]" }
      }
    end
  end

  private

    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:id, :weekDay, :muscularGroups, :description, :dateStart, :dateEnd, :duration, :patient_id, exercises_attributes: [:id, :name, :description, :series, :repeats, :duration, :_destroy])
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: 'Logue para continuar'
      end
    end
end
