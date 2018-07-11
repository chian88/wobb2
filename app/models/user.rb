class User < ApplicationRecord
	validates_presence_of :email, :password, :name
	validates_uniqueness_of :email
	validates :summary, length: { maximum: 200 }

	has_many :applications
	has_many :jobs, through: :applications

	has_secure_password
end