class RecentActivity < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user
  has_one :weighing
  has_one :measurement
  has_one :realization
end
