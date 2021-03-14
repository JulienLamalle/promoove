User.destroy_all
User.reset_pk_sequence
Project.destroy_all
Project.reset_pk_sequence
Role.destroy_all
Role.reset_pk_sequence
Collaboration.destroy_all
Collaboration.reset_pk_sequence
Donation.destroy_all
Donation.reset_pk_sequence
Media.destroy_all
Media.reset_pk_sequence
ProjectMedia.destroy_all
ProjectMedia.reset_pk_sequence
Category.destroy_all
Category.reset_pk_sequence
ProjectCategory.destroy_all
ProjectCategory.reset_pk_sequence
LanguageMedia.destroy_all
LanguageMedia.reset_pk_sequence
Language.destroy_all
Language.reset_pk_sequence
ProjectLanguage.destroy_all
ProjectLanguage.reset_pk_sequence

user = User.create(email: "julien@lamalle.com", password: "azerty", first_name: "Julien", last_name: "Lamalle", description: "Coucou", date_of_birth: "2021-03-13", professional_background: "THP", github_link: "mon super lien", gitlab_link: "mon super lien", twitter_link: "mon super lien", linkedin_link: "mon super lien")
project = Project.create(name: "Google", short_description: "I am a short description", long_description: "I am a long description", value_of_project: 1000, money_earned: 100, number_of_developpers_on_project: 3, daily_time_spent_on_project_per_developper: 4, is_complete: true, link_of_github: "iamthelink", license: "license123", is_validated: true)
role = Role.create(name: "CTO")
collab = Collaboration.create(user: user, project: project, role: role)
donation = Donation.create(user: user, project: project, amount: 2000)
media = Media.create(data_type: 'png', aws_link: 'https://www.link.fr')
project_media = ProjectMedia.create(project_id: 1, media_id: 1)
category = Category.create(name: 'Intelligence artificielle')
project_category = ProjectCategory.create(category: Category.last, project: Project.last)
language_media = LanguageMedia.create(data_type: 'image', aws_link: 'www.hello.com')
language = Language.create(name: 'Ruby', language_media: LanguageMedia.last)
project_language = ProjectLanguage.create(project: Project.last, language: language)


