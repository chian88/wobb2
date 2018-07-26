class User < ApplicationRecord
	validates_presence_of :email, :password, :name
	validates_uniqueness_of :email
	validates :summary, length: { maximum: 200 }

	has_many :applications
	has_many :jobs, through: :applications

	has_many :favourites
	has_many :favourite_jobs, through: :favourites, source: 'job'

	has_secure_password

	def generate_token
		self.token = SecureRandom.urlsafe_base64
	end
end