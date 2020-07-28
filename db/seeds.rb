# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

def create_users
  User.create(first_name: 'John', last_name: 'Doe', second_last_name: 'Toe',
              email: 'foo@bar.com', password: 'password',
              password_confirmation: 'password', confirmed_at: Time.zone.now)
end

def create_countries
  require 'csv'
  CSV.foreach('db/external_data/countries.csv', headers: true) do |row|
    Country.create(name: row['nombre'], iso_code: row['iso3'],
                   calling_code: row['phone_code'])
  end
end

def create_statuses
  Status.create(code: 'ACT', name: 'Activo', description: 'Estatus activo general')
  Status.create(code: 'INA', name: 'Inactivo', description: 'Estatus inactivo general')
end

create_users
create_countries
create_statuses
