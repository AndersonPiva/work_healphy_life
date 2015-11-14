class WeighingsController < ApplicationController
  before_action :set_weighing, only: [:show, :edit, :update, :destroy]
  before_action :verify_user

  def index

  end

  def show
  end

  def new
    @weighing = Weighing.new
  end

  def edit
  end

  def create
    @weighing = Weighing.new(weighing_params)
    @weighing.patient_id = current_patient.id
    respond_to do |format|
      if @weighing.save
        format.html { redirect_to weighings_path, notice: 'Weighing was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @weighing.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @weighing.destroy
    respond_to do |format|
      format.html { redirect_to weighings_url, notice: 'Weighing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_weighing
      @weighing = Weighing.find(params[:id])
    end

    def weighing_params
      params.require(:weighing).permit(:dateWeighing, :weight, :patient_id)
    end

    def verify_user
      if !current_patient.present?
        redirect_to new_patient_session_path, notice: 'Logue para continuar'
      end
    end
end
