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
Language.destroy_all
Language.reset_pk_sequence
ProjectLanguage.destroy_all
ProjectLanguage.reset_pk_sequence
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
category = ["Intelligence Artificielle", "BTP", "Santé", "FinTech", "Sport", "Entreprise", "Education", "IT"]
languages = ["Python", "Javascript", "Ruby", "Php", "HTML", "C++", "Java"]
languages_pictures = ["python.svg", "javascript.svg", "ruby.svg" , "php.svg" , "html.svg", "c-plus-plus.svg", "java.svg"]
picture_url = ["adobe-id.svg" , "gmail.svg", "paypal.svg", "ubuntu.svg", "sketch.svg", "play-store.svg", "outlook.svg", "icloud.svg"]

# Users
10.times do
    user = User.create(
        email: Faker::Internet.email,
        password: "Azerty",
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        description: Faker::Books::Dune.quote,
        date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
        professional_background: Faker::Job.field
    )
    user.update(
        email: "#{user.first_name}.#{user.last_name}@yopmail.com",
        github_link: "github.com/#{user.first_name}_#{user.last_name}",
        gitlab_link: "gitlab.com/#{user.first_name}_#{user.last_name}",
        twitter_link: "twitter.com/#{user.first_name}_#{user.last_name}",
        linkedin_link: "linkedin.com/#{user.first_name}_#{user.last_name}"
    )
    puts "seeding user #{user.first_name}"
end

# Projects
25.times do
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
        is_validated: true
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
    collab = Collaboration.create(
        user: User.all.sample,
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
    Category.create(
        name: category[i],
        picture_url: "svg/brands/" + picture_url[i]
    )
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

# Language
i = 0
languages.size.times do
    language = Language.create(
    name: languages[i],
    picture_url: "icons-languages/" + languages_pictures[i]
    )
    i += 1
end
puts "languages"

j=0
#Project Language
30.times do
    project_language = ProjectLanguage.create(
        project: Project.all[j],
        language: Language.all.sample
        )
        j += 1
end
puts "project languages"


#Comments
30.times do
    comment = Comment.create(
        content: Faker::Books::Dune.saying,
        user: User.all.sample,
        project: Project.all.sample
        )
end
puts "comments"
    
# Comment answer
30.times do    
    comment_answer = CommentAnswer.create(
        content: Faker::Books::Dune.saying,
        user: User.all.sample,
        comment: Comment.all.sample
        )
end
puts "comment answer"
    
#Comment answer upvote
50.times do
    comment_answer_upvote = CommentAnswerUpvote.create(
        user: User.all.sample, 
        comment_answer: CommentAnswer.all.sample
        )
end
puts "comment answer upvote"
    
#Comment Upvote
100.times do
    comment_upvote = CommentUpvote.create(
        user: User.all.sample,
        comment: Comment.all.sample
    )
end

50.times do 
    upvote = ProjectUpvote.create(
        user: User.all.sample,
        project: Project.all.sample
    )
end
puts "comment upvote"
puts "------------------ Seed completed -------------------"