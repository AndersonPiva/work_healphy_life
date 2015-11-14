class Admin::ClinicsController < Admin::AdminController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @clinics = Clinic.all
  end

  def show
  end

  def new
    @clinic = Clinic.new
    @clinic.build_address
  end

  def edit
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user_id = current_user.id
    respond_to do |format|
      if @clinic.save
        format.html { redirect_to admin_clinics_path, notice: 'Clinic was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to admin_clinics_path, notice: 'Clinic was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to admin_clinics_url, notice: 'Clinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def clinic_params
      params.require(:clinic).permit(:id, :name, :telephone1, :telephone2, :cpfCnpj, :user_id, address_attributes: [:id, :city, :state, :district, :street, :cep, :number, :reference])
    end
end
