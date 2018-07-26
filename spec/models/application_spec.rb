require 'rails_helper'

describe Application do
	it { should belong_to(:job) }
	it { should belong_to(:user) }

	it 'set a pending status for newly created application' do
		user = Fabricate(:user)
		job = Fabricate(:job)
		Application.create(user: user, job: job)
		expect(Application.first.status).to eq('pending')
	end
end