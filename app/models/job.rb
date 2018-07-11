class Job < ApplicationRecord
	belongs_to :employer
	has_many :applications
	has_many :users, through: :applications
	validates_presence_of :title, :description, :requirement
end