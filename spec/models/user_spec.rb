require 'rails_helper'

describe User do
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:name) }
	it { should ensure_length_of(:summary).is_at_most(200) }
	it { should have_many(:applications) }
	it { should have_many(:jobs) }
	it { should have_many(:favourite_jobs) }
	it { should have_many(:favourites) }

	it { should validate_uniqueness_of(:email) }
end