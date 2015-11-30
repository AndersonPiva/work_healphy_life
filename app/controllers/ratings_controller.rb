class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
    respond_to do |format|
     format.html

     format.pdf { render pdf: "avaliacao-fisica",
       footer: { center: "[page] of [topage]" },
       javascript_delay: 5000
     }
    end
  end

  private

    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:patient_id, :date, :handleDiameter, :kneeDiameter, :leg, :belly, :chest)
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: I18n.t('sign_in_to_continue')
      end
    end

end
