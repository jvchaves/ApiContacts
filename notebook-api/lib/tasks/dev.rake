namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    (0..100).each do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 55.years.ago, to: 18.years.ago)
      )

    end
  end

end
