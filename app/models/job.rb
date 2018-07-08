class Job < ApplicationRecord
	belongs_to :employer
	has_many :job_applications
	has_many :users, through: :job_applications
	validates_presence_of :title, :description, :requirement



	def industry_title
		case industry
		when 'IT'
			'Information Technology'
		when 'AC'
			'Accounting and Finance'
		when 'CON'
			'Consulting'
		when 'ED'
			'Education'
		end
	end

	def job_type_title
		case job_type
		when 'full_time'
			'Full Time'
		when 'part_time'
			'Part Time'
		when 'intern'
			'Intern'
		when 'contract'
			'Contract'
		end
	end

	def state_title
		case state
		when 'selangor'
			'Selangor'
		when 'kl'
			'Kuala Lumpur'
		when 'johor'
			'Johor'
		when 'penang'
			'Penang'
		end
	end
end