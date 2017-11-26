class User < ApplicationRecord
	has_many :posted_resources, class_name: "Resource", foreign_key: :author_id
	has_many :favorites, foreign_key: :fan_id
	has_many :favorited_resources, through: :favorites, source: :resource
	has_many :collections, foreign_key: :owner_id
	has_many :reviews, foreign_key: :author_id 


	validates :username, :email, :password, presence: true 
	validates :username, :email, uniqueness: true 

	# Include default devise modules. Others available are:
	# :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


end
