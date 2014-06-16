namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)

    User.create!(name: "test",
                 email: "test@test.com",
                 password: "123123",
                 password_confirmation: "123123",
                 admin: false)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 30)
    prefix = 1;
    2.times do
      app_name = Faker::Name.first_name
      package_name = Faker::Address.city
      app_description = Faker::Lorem.sentence
      website = Faker::Internet.url
      team_name = Faker::Company.name
      users.each { 
        |user| user.apps.create!(app_name:(app_name + "-#{prefix}"),
                                  package_name: package_name,
                                  app_description: app_description,
                                  website: website,
                                  team_name: team_name,
                                  fingerprint:("1q2w3e" + "-#{prefix}"))
        prefix += 1

      }

    end
  end
end