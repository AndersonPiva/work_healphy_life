class WeighingsController < ApplicationController
  before_action :set_weighing, only: [:show, :edit, :update, :destroy]

  # GET /weighings
  # GET /weighings.json
  def index
    @weighings_foruser = []
    weighings_all = Weighing.all
    weighings_all.each do |weighing|
      if weighing.patient.user.id == current_user.id
        @weighings_foruser << weighing
      end

    @weighings_foruser
    end
  end

  # GET /weighings/1
  # GET /weighings/1.json
  def show
  end

  # GET /weighings/new
  def new
    @weighing = Weighing.new
  end

  # GET /weighings/1/edit
  def edit
  end

  # POST /weighings
  # POST /weighings.json
  def create
    @weighing = Weighing.new(weighing_params)

    respond_to do |format|
      if @weighing.save
        format.html { redirect_to @weighing, notice: 'Weighing was successfully created.' }
        format.json { render :show, status: :created, location: @weighing }
      else
        format.html { render :new }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weighings/1
  # PATCH/PUT /weighings/1.json
  def update
    respond_to do |format|
      if @weighing.update(weighing_params)
        format.html { redirect_to @weighing, notice: 'Weighing was successfully updated.' }
        format.json { render :show, status: :ok, location: @weighing }
      else
        format.html { render :edit }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weighings/1
  # DELETE /weighings/1.json
  def destroy
    @weighing.destroy
    respond_to do |format|
      format.html { redirect_to weighings_url, notice: 'Weighing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weighing
      @weighing = Weighing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weighing_params
      params.require(:weighing).permit(:dateWeighing, :weight, :patient_id)
    end
end
