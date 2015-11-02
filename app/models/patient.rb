class Patient < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :user

  has_many :appointments, :dependent => :delete_all
  has_many :weighings, :dependent => :delete_all
  has_many :measurements, :dependent => :delete_all
  has_many :trainings, :dependent => :delete_all
  has_many :realizations, :dependent => :delete_all
  has_many :ratings, :dependent => :delete_all
  has_many :diets, :dependent => :delete_all
  has_one :address, :dependent => :delete
  accepts_nested_attributes_for :address, :reject_if => :all_blank, :allow_destroy => true

  def getAge
    Date.today.year - self.birthdate.year
  end
end
