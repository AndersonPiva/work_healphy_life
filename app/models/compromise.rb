class Compromise < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :date, :schedule
end
