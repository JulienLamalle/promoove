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
MediaType.destroy_all
MediaType.reset_pk_sequence
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
Competition.destroy_all
Competition.reset_pk_sequence
ProjectCompetition.destroy_all
ProjectCompetition.reset_pk_sequence
ProjectCompetitionUpvote.destroy_all
ProjectCompetitionUpvote.reset_pk_sequence
BadgeType.destroy_all
BadgeType.reset_pk_sequence
Badge.destroy_all
Badge.reset_pk_sequence
Comment.destroy_all
Comment.reset_pk_sequence
CommentAnswer.destroy_all
CommentAnswer.reset_pk_sequence
CommentAnswerUpvote.destroy_all
CommentAnswerUpvote.reset_pk_sequence
CommentUpvote.destroy_all
CommentUpvote.reset_pk_sequence

user = User.create(email: "julien@lamalle.com", password: "azerty", first_name: "Julien", last_name: "Lamalle", description: "Coucou", date_of_birth: "2021-03-13", professional_background: "THP", github_link: "mon super lien", gitlab_link: "mon super lien", twitter_link: "mon super lien", linkedin_link: "mon super lien")
project = Project.create(name: "Google", short_description: "I am a short description", long_description: "I am a long description", value_of_project: 1000, money_earned: 100, number_of_developpers_on_project: 3, daily_time_spent_on_project_per_developper: 4, is_complete: true, link_of_github: "iamthelink", license: "license123", is_validated: true)
role = Role.create(name: "CTO")
collab = Collaboration.create(user: user, project: project, role: role)
donation = Donation.create(user: user, project: project, amount: 2000)
media_type = MediaType.create(name: 'image')
media = Media.create(media_type: MediaType.first, aws_link: 'https://www.link.fr')
project_media = ProjectMedia.create(project_id: 1, media_id: 1)
category = Category.create(name: 'Intelligence artificielle')
project_category = ProjectCategory.create(category: Category.last, project: Project.last)
language_media = LanguageMedia.create(data_type: 'image', aws_link: 'www.hello.com')
language = Language.create(name: 'Ruby', language_media: LanguageMedia.last)
project_language = ProjectLanguage.create(project: Project.last, language: language)
competition = Competition.create(name: 'Best competition', duration: 7)
project_competition = ProjectCompetition.create(project: project, competition: competition, upvote_number: 132)
project_competition_upvote = ProjectCompetitionUpvote.create(project_competition: project_competition, user: user )
badge_type = BadgeType.create(name: 'Or')
badge_media = BadgeMedia.create(aws_link: 'linkdunbadge.com')
badge = Badge.create(badge_type: BadgeType.last, badge_media: BadgeMedia.last, project_competition: project_competition)
comment = Comment.create(content: "Ceci est un commentaire comme on en fait plus", user: user, project: project)
comment_answer = CommentAnswer.create(content: "Ceci est un commentaire d'un commentaire comme on en fait plus", user: user, comment: comment)
comment_answer_upvote = CommentAnswerUpvote.create(user: user, comment_answer: comment_answer)
comment_upvote = CommentUpvote.create(user: user, comment: comment)