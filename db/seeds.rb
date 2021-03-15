require 'faker'
Faker::Config.locale = 'fr'

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

# Arrays of data
media_type = ["text", "image", "videos", "son"]
category = ["Intelligence Artificielle", "BTP", "Santé", "FinTech", "Sport"]
languages = ["python", "javascript", "ruby", "C#", "HTML"]

# Users
10.times do
    user = User.create(
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::Books::Dune.quote,
        date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
        professional_background: Faker::Job.field
    )
    user.update(
        email: "#{user.first_name}.#{user.last_name}@yopmail.com",
        github_link: "github.io/#{user.first_name}_#{user.last_name}",
        gitlab_link: "gitlab.io/#{user.first_name}_#{user.last_name}",
        twitter_link: "twitter.com/#{user.first_name}_#{user.last_name}",
        linkedin_link: "linkedin.com/#{user.first_name}_#{user.last_name}"
    )
    puts "seeding user #{user.first_name}"
end

# Projects
5.times do
    project = Project.create(
        name: Faker::Beer.name,
        short_description: Faker::Books::Dune.quote,
        long_description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        value_of_project: Faker::Number.number(digits: 4),
        money_earned: Faker::Number.number(digits: 3),
        number_of_developpers_on_project: Faker::Number.number(digits: 2),
        daily_time_spent_on_project_per_developper: Faker::Number.number(digits: 1),
        is_complete: Faker::Boolean.boolean,
        license: Faker::Code.rut,
        is_validated: Faker::Boolean.boolean
    )
    project.update(link_of_github: "github.io/#{project.name}")
    puts "seeding project #{project.name}"
end

# Roles
10.times do
    role = Role.create(name: Faker::Job.seniority)
    puts "seeding role #{role.name}"
end

# Collaborations
20.times do
    collab = Collaboration.create(user: User.all.sample,
    project: Project.all.sample,
    role: Role.all.sample
    )
end
puts "collaborations created"

# Donations
25.times do
    donation = Donation.create(user: User.all.sample,
    project: Project.all.sample,
    amount: Faker::Number.number(digits: 2)
    )
end
puts "donations dones"

# Media type
i = 0
media_type.size.times do
    MediaType.create(name: media_type[i])
    i += 1
end
puts "media types created"

# Media
25.times do
    media = Media.create(media_type: MediaType.first,
    aws_link: Faker::Internet.url(host: 'aws.com')
    )
end
puts "Media created"

# Project Media
25.times do
    project_media = ProjectMedia.create(project_id: 1, media_id: 1)
end
puts "Project media created"

# Category
i = 0
category.size.times do
    Category.create(name: category[i])
    i += 1
end
puts "category created"

# Project category
15.times do
    project_category = ProjectCategory.create(category: Category.all.sample,
    project: Project.all.sample
    )
end
puts "project category"

# Language Media
5.times do
    language_media = LanguageMedia.create(data_type: 'image',
    aws_link: Faker::Internet.url(host: 'aws.com')
    )
end
puts "language media"

# Language
i = 0
languages.size.times do
    language = Language.create(name: languages[i],
    language_media: LanguageMedia.last
    )
    i += 1
end
puts "languages"

#Project Language
3.times do
    project_language = ProjectLanguage.create(project: Project.all.sample, language: Language.all.sample)
end
puts "project languages"

# Competition
3.times do
    competition = Competition.create(name: Faker::Team.state + ' league', duration: 7)
end
puts "competition"

=begin
    project_competition = ProjectCompetition.create(project: project, competition: competition, upvote_number: 132)
    project_competition_upvote = ProjectCompetitionUpvote.create(project_competition: project_competition, user: user )
    badge_type = BadgeType.create(name: 'Or')
    badge_media = BadgeMedia.create(aws_link: 'linkdunbadge.com')
    badge = Badge.create(badge_type: BadgeType.last, badge_media: BadgeMedia.last, project_competition: project_competition)
    comment = Comment.create(content: "Ceci est un commentaire comme on en fait plus", user: user, project: project)
    comment_answer = CommentAnswer.create(content: "Ceci est un commentaire d'un commentaire comme on en fait plus", user: user, comment: comment)
    comment_answer_upvote = CommentAnswerUpvote.create(user: user, comment_answer: comment_answer)
    comment_upvote = CommentUpvote.create(user: user, comment: comment)
=end