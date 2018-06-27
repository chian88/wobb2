require 'rails_helper'

describe Job do
	it { should belong_to(:employer) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:requirement) }

	describe '#industry_title' do
		it 'returns the industry title accurately' do
			job = Fabricate(:job, industry: 'IT')
			expect(job.industry_title).to eq('Information Technology')
		end
	end

	describe '#job_type_title' do
		it 'returns the job type title accurately' do
			job = Fabricate(:job, job_type: 'full_time')
			expect(job.job_type_title).to eq('Full Time')
		end
	end

	describe '#state_title' do
		it 'returns the state title accurately' do
			job = Fabricate(:job, state: 'selangor')
			expect(job.state_title).to eq('Selangor')
		end
	end
end