require 'rails_helper'

describe Job do
	it { should belong_to(:employer) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:requirement) }
	it { should have_many(:applications) }
	it { should have_many(:users) }

	it { should have_many(:favourites) }
	it { should have_many(:favourite_users) }
end