class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "50x50" }, default_url: "/images/:style/atendente.png"
  has_many :clinics, :dependent => :delete_all
  has_many :patients, :dependent => :delete_all
  has_many :appointments, :dependent => :delete_all
  has_many :compromises, :dependent => :delete_all

end
