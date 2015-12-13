  class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

 belongs_to :clinic
 belongs_to :user
 has_attached_file :cover, styles: { :medium => "300x300>", :thumb => "50x50", :small => "168x168", :thumb => "40x40", :tiny => "32x32" }, default_url: "/img/missing.png"
 has_many :appointments, :dependent => :destroy
 has_many :weighings, :dependent => :destroy
 has_many :measurements, :dependent => :destroy
 has_many :trainings, :dependent => :destroy
 has_many :realizations, :dependent => :destroy
 has_many :ratings, :dependent => :destroy
 has_many :diets, :dependent => :destroy
 has_many :recent_activities, :dependent => :destroy
 has_many :reminders, :dependent => :destroy

 def getAge
   Date.today.year - self.birthdate.year
 end

 def getBicepsLeftSize
   bicepsLeft = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Bíceps Esquerdo"
       bicepsLeft = measurement.size
     end
   end

   bicepsLeft
 end

 def getBicepsRigthSize
   bicepsRigth = nil

   self.measurements.each do |measurement|
     if measurement.nameMeasure == "Bíceps Direito"
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
     if measurement.nameMeasure == "Abdômen"
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
