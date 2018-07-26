class Application < ApplicationRecord
	belongs_to :job
	belongs_to :user

	validates :user, uniqueness: { scope: :job }

	before_create :set_status

	private

	def set_status
		self.status = 'pending'
	end
end