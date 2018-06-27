class Employer < ApplicationRecord
	has_many :jobs
	validates_presence_of :name, :story
end