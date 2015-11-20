class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :cover, styles: { :medium => "300x300>", :thumb => "50x50", :small => "168x168", :thumb => "40x40", :tiny => "32x32" }, default_url: "/img/missing.png"
  has_many :clinics, :dependent => :destroy
  has_many :patients, :dependent => :destroy
  has_many :appointments, :dependent => :destroy
  has_many :compromises, :dependent => :destroy
  has_many :recent_activities, :dependent => :destroy

  
end
