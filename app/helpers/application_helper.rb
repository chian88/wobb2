module ApplicationHelper
	def industry_title(job)
		case job.industry
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

	def job_type_title(job)
		case job.job_type
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

	def state_title(job)
		case job.state
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
