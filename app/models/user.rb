class User < ApplicationRecord
	has_many :posted_resources, class_name: "Resource", foreign_key: :author_id
	has_many :favorites, foreign_key: :fan_id
	has_many :favorited_resources, through: :favorites, source: :resource
	has_many :collections, foreign_key: :owner_id
	has_many :reviews, foreign_key: :author_id 

	validates :password, presence: true, length: {minimum: 5, maximum: 18}, on: :create
	validates :password, length: {minimum: 5, maximum: 18}, on: :update, allow_blank: true
	validates :username, :email, presence: true 
	validates :username, :email, uniqueness: true 
	validates_inclusion_of :admin, in: [true, false]
	validates_inclusion_of :subscribe, in: [true, false]

	# Include default devise modules. Others available are:
	# :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable


end
