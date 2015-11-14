class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

 belongs_to :clinic
 belongs_to :user

 has_many :appointments, :dependent => :delete_all
 has_many :weighings, :dependent => :delete_all
 has_many :measurements, :dependent => :delete_all
 has_many :trainings, :dependent => :delete_all
 has_many :realizations, :dependent => :delete_all
 has_many :ratings, :dependent => :delete_all
 has_many :diets, :dependent => :delete_all

 def getAge
   Date.today.year - self.birthdate.year
 end

 def getBicepsLeftSize
   bicepsLeft = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Biceps Esquerdo"
       bicepsLeft = measurement.size
     end
   end

   bicepsLeft
 end

 def getBicepsRigthSize
   bicepsRigth = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Biceps Direito"
       bicepsRigth = measurement.size
     end
   end

   bicepsRigth
 end


 def getHipsSize
   hipsSize = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Quadril"
       hipsSize = measurement.size
     end
   end

   hipsSize
 end

 def getBellySize
   bellySize = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Abdomen"
       bellySize = measurement.size
     end
   end

   bellySize
 end

 def getWaistSize
   waistSize = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Cintura"
       waistSize = measurement.size
     end
   end

   waistSize
 end

 def getLegRigthSize
   legRigthSize = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Coxa Direita"
       legRigthSize = measurement.size
     end
   end

   legRigthSize
 end

 def getLegLeftSize
   legLeftSize = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Coxa Esquerda"
       legLeftSize = measurement.size
     end
   end

   legLeftSize
 end
end
