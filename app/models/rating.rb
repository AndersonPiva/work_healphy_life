class Rating < ActiveRecord::Base
  belongs_to :patient

  def getOsseousWeight
    osseousWeight = 3.02 * (self.patient.heigth**2 * self.handleDiameter * self.kneeDiameter*400)**0.712
  end

  def getResidualWeight
    residualWeight = 0;

    if(self.patient.genre == "Masculino")
      residualWeight = (self.patient.weighings.last.weight * 24.1)/100
    end

    if(self.patient.genre == "Feminino")
      residualWeight = (self.patient.weighings.last.weight * 20.9)/100
    end

    residualWeight
  end

  def getBF
    soma = self.leg + self.belly + self.chest
    densidade = 1.1093800 - (0.0008267 * soma) + (0.0000016 * soma ** 2) - (0.0002574 * self.patient.getAge)
    bf = (4.95/densidade - 4.5) * 100
    bf.round(2)
  end

  def getFatWeight
    (self.patient.weighings.last * self.getBF)/100
  end

  def getMuscularWeight
   self.patient.weighings.last -(self.getFatWeight + self.getOsseousWeight + self.getResidualWeight)
  end
end
