class Realization < ActiveRecord::Base
  belongs_to :training
  belongs_to :patient
  belongs_to :recent_activity
end
