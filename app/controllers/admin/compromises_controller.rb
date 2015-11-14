class Admin::CompromisesController < Admin::AdminController
  before_action :set_compromise, only: [:show, :edit, :update, :destroy]

  def index
    @compromises = []
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

    Compromise.all.each do |compromise|
      if compromise.user.id == current_user.id
        @compromises << compromise
      end
    end
  end

  def show
  end

  def new
    @compromise = Compromise.new
  end

  def edit
  end

  def create
    @compromise = Compromise.new(compromise_params)
    @compromise.user_id = current_user.id

    respond_to do |format|
      if @compromise.save
        format.html { redirect_to admin_compromises_path, notice: 'Compromise was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @compromise.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @compromise.update(compromise_params)
        format.html { redirect_to admin_compromises_path, notice: 'Compromise was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @compromise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @compromise.destroy
    respond_to do |format|
      format.html { redirect_to admin_compromises_url, notice: 'Compromise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_compromise
      @compromise = Compromise.find(params[:id])
    end

    def compromise_params
      params.require(:compromise).permit(:title, :date, :schedule, :description, :user_id)
    end
end
