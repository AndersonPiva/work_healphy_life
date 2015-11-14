class Admin::MeasurementsController < Admin::AdminController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  def index
    @measurements_for_user = []

    Measurement.all.each do |measurement|
      if measurement.patient.user.id == current_user.id
        @measurements_for_user << measurement
      end
    end
  end

  def show
  end

  def new
    @measurement = Measurement.new
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to admin_measurements_path, notice: 'Measurement was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to admin_measurements_path, notice: 'Measurement was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to admin_measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:date, :nameMeasure, :size, :patient_id)
    end
end
