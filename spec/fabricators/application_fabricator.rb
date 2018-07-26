Fabricator(:application) do
	job { Fabricate(:job) }
	user { Fabricate(:user) }
end