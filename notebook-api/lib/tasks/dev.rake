namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts 'Resetando o banco'
    %x(rails db:drop db:create db:migrate)
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Cadastrando Contact......'
    (0..100).each do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 55.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Contact Cadastrado com sucesso......'
    puts 'Cadastrando Phones......'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone,contact_id: contact.id)
        contact.phones << phone
        contact.save
      end
    end
    puts 'Phones cadastrados com sucesso......'
    puts 'Cadastrando Addres......'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts 'Address cadastrado com sucesso......'
  end

end
