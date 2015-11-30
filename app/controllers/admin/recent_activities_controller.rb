class Admin::RecentActivitiesController < Admin::AdminController
  before_action :set_recent_activity, only: [:show, :edit, :update, :destroy]

  def index
    @recent_activities_last_login = []

    current_user.recent_activities.each do |recent_activity|
      if recent_activity.created_at > current_user.last_sign_in_at
        @recent_activities_last_login << recent_activity
      end
    end
  end

  def show
  end

  private
    def set_recent_activity
      @recent_activity = RecentActivity.find(params[:id])
    end

    def recent_activity_params
      params.require(:recent_activity).permit(:date, :patient_id, :user_id, :description, :shedule)
    end
end
