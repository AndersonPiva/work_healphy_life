class Admin::RatingsController < Admin::AdminController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings_for_user = []

    Rating.all.each do |rating|
      if rating.patient.user_id == current_user.id
        @ratings_for_user << rating
      end
    end
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

  def new
    @rating = Rating.new
  end

  def edit
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.date = Date.today
    respond_to do |format|
      if @rating.save
        format.html { redirect_to admin_ratings_path, notice: I18n.t('register_created') }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to admin_ratings_path, notice: I18n.t('register_updated') }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to admin_ratings_url, notice: I18n.t('register_destroyed') }
      format.json { head :no_content }
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
