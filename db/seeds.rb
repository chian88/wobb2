# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wobb = Employer.create(name: 'WOBB', story: 'We are estabished in 2011. Our mission to become the online HR champion in Malaysia.')

grab = Employer.create(name: 'GRAB', story: 'We are estabished in 2012. Our mission to become the online taxi champion in SEA.')

kevin = User.create(name: 'Kevin', email: 'kevin@example.com', password: 'password', summary: 'I am a good man.')

Job.create(title: "Software Engineer", description: "This job involved building application and maintaining it.", requirement: '1. Computer Science Degree. 2. Three years of experience in software development.', employer_id: wobb.id, industry: 'IT', state: 'kl', job_type: 'full_time')

Job.create(title: "Software Engineer II", description: "This job involved building application and maintaining it.", requirement: '1. Computer Science Degree. 2. Five years of experience in software development.', employer_id: grab.id, industry: 'IT', state: 'kl', job_type: 'full_time')

Job.create(title: "Senior Software Engineer", description: "This job involved building application and maintaining it.", requirement: '1. Computer Science Degree. 2. Ten years of experience in software development.', employer_id: grab.id, industry: 'ED', state: 'penang', job_type: 'part_time')