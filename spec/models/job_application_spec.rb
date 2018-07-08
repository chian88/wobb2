require 'rails_helper'

describe JobApplication do
	it { should belong_to(:job) }
	it { should belong_to(:user) }
end