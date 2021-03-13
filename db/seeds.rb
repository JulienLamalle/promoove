# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.reset_pk_sequence
Project.destroy_all
Project.reset_pk_sequence
Role.destroy_all
Role.reset_pk_sequence
Collaboration.destroy_all
Collaboration.reset_pk_sequence

user = User.create(email: "julien@lamalle.com", password: "azerty", first_name: "Julien", last_name: "Lamalle", description: "Coucou", date_of_birth: "2021-03-13", professional_background: "THP", github_link: "mon super lien", gitlab_link: "mon super lien", twitter_link: "mon super lien", linkedin_link: "mon super lien")
project = Project.create(name: "Google", short_description: "I am a short description", long_description: "I am a long description", value_of_project: 1000, money_earned: 100, number_of_developpers_on_project: 3, daily_time_spent_on_project_per_developper: 4, is_complete: true, link_of_github: "iamthelink", license: "license123", is_validated: true)
role = Role.create(name: "CTO")
collab = Collaboration.create(user: user, project: project, role: role)
donation = Donation.create(user: user, project: project, amount: 2000)