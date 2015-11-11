class Clinic < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, :dependent => :delete_all
  has_many :patients, :dependent => :destroy
  validates_presence_of :name, :telephone1
  has_one :address, :dependent => :delete
  accepts_nested_attributes_for :address, :reject_if => :all_blank, :allow_destroy => true

  def totalAppointments
    self.appointments.size
  end

  def totalPatients
    self.patients.size
  end

  def getNumberWomans
    numWomans = 0;

    self.patients.each do |patient|
      if patient.genre == "Feminino"
        numWomans = numWomans + 1;
      end
    end
    numWomans;
  end

  def getNumberMans
    numberMans = 0;

    self.patients.each do |patient|
      if patient.genre == "Masculino"
        numberMans = numberMans + 1;
      end
    end
    numberMans;
  end
end
