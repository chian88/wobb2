Fabricator(:job) do
	title { Faker::Name.name }
	description { Faker::Lorem.paragraph(1) }
	requirement { Faker::Lorem.paragraph(1) }
	employer { Fabricate(:employer) }
	industry { ['IT', 'AC', 'CON', 'ED'].sample }
	state { ['selangor', 'kl', 'johor', 'penang'].sample }
	job_type { ['full_time', 'part_time', 'intern', 'contract'].sample }
end