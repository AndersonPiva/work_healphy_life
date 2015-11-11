  class Admin::PatientsController < Admin::AdminController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception

  def index
    @q = current_user.patients.ransack(params[:q])
    @patients_for_user = @q.result(distinct: true)
  end

  def show
  end

  def new
    @patient = Patient.new
    @patient.build_address
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    respond_to do |format|
      if @patient.save
        format.html { redirect_to admin_patients_path, notice: 'Patient was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to admin_patients_path, notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to admin_patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :birthdate, :genre, :cpf, :weigth, :heigth, :bf, :objective, :observations, :telephone, :email, :login, :password, :user_id, :clinic_id, address_attributes: [:id, :city, :state, :district, :street, :cep, :number, :reference])
    end
end
