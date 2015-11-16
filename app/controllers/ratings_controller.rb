class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

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

end
