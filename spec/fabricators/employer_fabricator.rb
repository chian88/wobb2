Fabricator(:employer) do
	name { Faker::Name.name }
	email { Faker::Internet.email }
	password { 'password' }
	story { Faker::Lorem.paragraph(1) }
end