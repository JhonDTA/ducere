# frozen_string_literal: true

require 'faker'

def create_statuses
  Status.create(code: 'ACT', name: 'Activo', description: 'Estatus activo general')
  Status.create(code: 'INA', name: 'Inactivo', description: 'Estatus inactivo general')
end

def create_users
  User.create(first_name: 'John', last_name: 'Doe', second_last_name: 'Toe',
              email: 'foo@bar.com', password: 'password',
              password_confirmation: 'password', confirmed_at: Time.zone.now)
  2999.times do |n|
    User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                second_last_name: Faker::Name.last_name,
                email: "foo#{n}@bar.com", password: 'password',
                password_confirmation: 'password', confirmed_at: Time.zone.now)
  end
end

def create_countries
  require 'csv'
  CSV.foreach('db/external_data/countries.csv', headers: true) do |row|
    Country.create(name: row['nombre'], iso_code: row['iso3'],
                   calling_code: row['phone_code'])
  end
end

def create_institutions
  Institution.delete_all
  country_codes = %w[MEX USA DEU]
  30.times do
    Institution.create(code: Faker::Alphanumeric.alphanumeric(number: 10).upcase,
                       name: Faker::University.name,
                       description: Faker::Lorem.paragraph(sentence_count: 2),
                       country: Country.where(iso_code: country_codes.sample).first,
                       status: @status)
  end
end

def create_campuses
  Institution.all.each do |institution|
    qty = ((rand * 3) + 1).floor
    qty.times do
      name = "Plantel #{Faker::Address.city}"
      institution.campuses.create(code: Faker::Alphanumeric.alphanumeric(number: 5).upcase,
                                  name: name, description: "#{institution.name} #{name}",
                                  status: @status)
    end
  end
end

Faker::Config.locale = 'es-MX'
@status = Status.where(code: 'ACT').first
create_users if false
create_countries if false
create_statuses if false
create_institutions if false
create_campuses if true
