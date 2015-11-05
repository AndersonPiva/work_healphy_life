class Measurement < ActiveRecord::Base
  belongs_to :patient

  validates_presence_of :date, :nameMeasure, :size, :patient_id
end
