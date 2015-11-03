class Rating < ActiveRecord::Base
  belongs_to :patient

  def getOsseousWeight
    osseousWeight = 3.02 * (self.patient.heigth**2 * self.handleDiameter * self.kneeDiameter*400)**0.712
    osseousWeight.round(2)
  end

  def getResidualWeight
    residualWeight = 0;

    if(self.patient.genre == "Masculino")
      residualWeight = (self.patient.weighings.last.weight * 24.1)/100
    end

    if(self.patient.genre == "Feminino")
      residualWeight = (self.patient.weighings.last.weight * 20.9)/100
    end

    residualWeight.round(2)
  end

  def getBF
    soma = self.leg + self.belly + self.chest
    densidade = 1.1093800 - (0.0008267 * soma) + (0.0000016 * soma ** 2) - (0.0002574 * self.patient.getAge)
    bf = (4.95/densidade - 4.5) * 100
    bf.round(2)
  end

  def getBFClassification
    classification = "Indefinida"
    if self.patient.genre == "Masculino"
      if self.patient.getAge <= 25
        if self.getBF >= 4 && self.getBF <= 8
            classification = "Excelente"
        end
        if self.getBF > 8 && self.getBF <= 12
          classification = "Bom"
        end
        if self.getBF > 12 && self.getBF <= 13
          classification = "Acima da Média"
        end
        if self.getBF > 13 && self.getBF <= 16
          classification = "Média"
        end
        if self.getBF > 16 && self.getBF <= 20
          classification = "Abaixo da Média"
        end
        if self.getBF > 20 && self.getBF <= 24
          classification = "Ruim"
        end
        if self.getBF > 24 && self.getBF <= 36
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 26 && self.patient.getAge <= 35
        if self.getBF >= 8 && self.patient.getBF <= 11
          classification = "Exelente"
        end
        if self.getBF > 11 && self.patient.getBF <= 15
          classification = "Bom"
        end
        if self.getBF > 15 && self.getBF <= 18
          classification = "Acima da Média"
        end
        if self.getBF > 13 && self.getBF <= 16
          classification = "Média"
        end
        if self.getBF > 18 && self.getBF <= 20
          classification = "Abaixo da Média"
        end
        if self.getBF > 20 && self.getBF <= 24
          classification = "Ruim"
        end
        if self.getBF > 24 && self.getBF <= 36
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 36 && self.patient.getAge <= 45
        if self.getBF >= 10 && self.getBF <= 14
          classification = "Exelente"
        end
        if self.getBF > 14 && self.getBF <= 18
          classification = "Bom"
        end
        if self.getBF > 18 && self.getBF <= 21
          classification = "Acima da Média"
        end
        if self.getBF > 21 && self.getBF <= 23
          classification = "Média"
        end
        if self.getBF > 23 && self.getBF <= 25
          classification = "Abaixo da Média"
        end
        if self.getBF > 25 && self.getBF <= 29
          classification = "Ruim"
        end
        if self.getBF > 29 && self.getBF <= 39
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 46 && self.patient.getAge <= 55
        if self.getBF >= 12 && self.getBF <= 16
          classification = "Exelente"
        end
        if self.getBF > 16 && self.getBF <= 20
          classification = "Bom"
        end
        if self.getBF > 20 && self.getBF <= 23
          classification = "Acima da Média"
        end
        if self.getBF > 23 && self.getBF <= 25
          classification = "Média"
        end
        if self.getBF > 25 && self.getBF <= 27
          classification = "Abaixo da Média"
        end
        if self.getBF > 27 && self.getBF <= 30
          classification = "Ruim"
        end
        if self.getBF > 30 && self.getBF <= 38
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 56 && self.patient.getAge <= 65
        if self.getBF >= 13 && self.getBF <= 18
          classification = "Exelente"
        end
        if self.getBF > 18 && self.getBF <= 21
          classification = "Bom"
        end
        if self.getBF > 21 && self.getBF <= 23
          classification = "Acima da Média"
        end
        if self.getBF > 23 && self.getBF <= 25
          classification = "Média"
        end
        if self.getBF > 25 && self.getBF <= 27
          classification = "Abaixo da Média"
        end
        if self.getBF > 27 && self.getBF <= 30
          classification = "Ruim"
        end
        if self.getBF > 30 && self.getBF <= 38
          classification = "Muito Ruim"
        end
      end
    end
    if self.patient.genre == "Feminino"
      if self.patient.getAge <= 25
        if self.getBF >= 13 && self.getBF <= 16
            classification = "Excelente"
        end
        if self.getBF > 16 && self.getBF <= 19
          classification = "Bom"
        end
        if self.getBF > 19 && self.getBF <= 22
          classification = "Acima da Média"
        end
        if self.getBF > 22 && self.getBF <= 25
          classification = "Média"
        end
        if self.getBF > 25 && self.getBF <= 28
          classification = "Abaixo da Média"
        end
        if self.getBF > 28 && self.getBF <= 31
          classification = "Ruim"
        end
        if self.getBF > 31 && self.getBF <= 43
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 26 && self.patient.getAge <= 35
        if self.getBF >= 14 && self.patient.getBF <= 16
          classification = "Exelente"
        end
        if self.getBF > 16 && self.patient.getBF <= 20
          classification = "Bom"
        end
        if self.getBF > 20 && self.getBF <= 23
          classification = "Acima da Média"
        end
        if self.getBF > 23 && self.getBF <= 25
          classification = "Média"
        end
        if self.getBF > 25 && self.getBF <= 29
          classification = "Abaixo da Média"
        end
        if self.getBF > 29 && self.getBF <= 33
          classification = "Ruim"
        end
        if self.getBF > 33 && self.getBF <= 49
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 36 && self.patient.getAge <= 45
        if self.getBF >= 16 && self.getBF <= 19
          classification = "Exelente"
        end
        if self.getBF > 19 && self.getBF <= 23
          classification = "Bom"
        end
        if self.getBF > 23 && self.getBF <= 26
          classification = "Acima da Média"
        end
        if self.getBF > 26 && self.getBF <= 29
          classification = "Média"
        end
        if self.getBF > 29 && self.getBF <= 32
          classification = "Abaixo da Média"
        end
        if self.getBF > 32 && self.getBF <= 36
          classification = "Ruim"
        end
        if self.getBF > 36 && self.getBF <= 48
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 46 && self.patient.getAge <= 55
        if self.getBF >= 17 && self.getBF <= 21
          classification = "Exelente"
        end
        if self.getBF > 21 && self.getBF <= 25
          classification = "Bom"
        end
        if self.getBF > 25 && self.getBF <= 28
          classification = "Acima da Média"
        end
        if self.getBF > 28 && self.getBF <= 31
          classification = "Média"
        end
        if self.getBF > 31 && self.getBF <= 34
          classification = "Abaixo da Média"
        end
        if self.getBF > 34 && self.getBF <= 38
          classification = "Ruim"
        end
        if self.getBF > 38 && self.getBF <= 50
          classification = "Muito Ruim"
        end
      end
      if self.patient.getAge >= 56 && self.patient.getAge <= 65
        if self.getBF >= 18 && self.getBF <= 22
          classification = "Exelente"
        end
        if self.getBF > 22 && self.getBF <= 26
          classification = "Bom"
        end
        if self.getBF > 26 && self.getBF <= 29
          classification = "Acima da Média"
        end
        if self.getBF > 29 && self.getBF <= 32
          classification = "Média"
        end
        if self.getBF > 32 && self.getBF <= 35
          classification = "Abaixo da Média"
        end
        if self.getBF > 35 && self.getBF <= 38
          classification = "Ruim"
        end
        if self.getBF > 38 && self.getBF <= 49
          classification = "Muito Ruim"
        end
      end
    end

    classification
  end

  def getFatWeight
    fatWeight = (self.patient.weighings.last.weight * self.getBF)/100
    fatWeight.round(2)
  end

  def getMuscularWeight
   muscularWeight = self.patient.weighings.last.weight - (self.getFatWeight + self.getOsseousWeight + self.getResidualWeight)
   muscularWeight.round(2)
  end

  def getLeanMass
    leanMass = self.getMuscularWeight + self.getResidualWeight + self.getOsseousWeight

    leanMass.round(2)
  end
end
