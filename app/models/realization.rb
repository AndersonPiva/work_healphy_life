class Realization < ActiveRecord::Base
  belongs_to :training
  belongs_to :patient
end
