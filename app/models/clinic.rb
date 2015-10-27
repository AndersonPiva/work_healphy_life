class Clinic < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, :dependent => :delete_all
  has_many :patients, :dependent => :delete_all

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
