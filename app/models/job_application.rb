class JobApplication < ApplicationRecord
	belongs_to :job
	belongs_to :user

	validates_uniqueness_of :user_id
end