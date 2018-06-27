Fabricator(:employer) do
	name { Faker::Name.name }
	story { Faker::Lorem.paragraph(1) }
end