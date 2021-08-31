namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    (0..100).each do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 55.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone,contact_id: contact.id)
        contact.phones << phone
        contact.save
      end
    end
  end

end
