require 'rails_helper'

describe Employer do
	it { should have_many(:jobs) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:story) }
end