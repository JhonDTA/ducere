# frozen_string_literal: true

require 'csv'
require 'faker'

def create_statuses
  Status.create(code: 'ACT', name: 'Activo', description: 'Estatus activo general')
  Status.create(code: 'INA', name: 'Inactivo', description: 'Estatus inactivo general')
end

def create_users
  User.create(first_name: 'John', last_name: 'Doe', second_last_name: 'Toe',
              email: 'foo@bar.com', password: 'password',
              password_confirmation: 'password', confirmed_at: Time.zone.now)
  299.times do |n|
    User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                second_last_name: Faker::Name.last_name,
                email: "foo#{n}@bar.com", password: 'password',
                password_confirmation: 'password', confirmed_at: Time.zone.now)
  end
end

def create_countries
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
    ((rand * 3) + 1).floor.times do
      name = "Plantel #{Faker::Address.city}"
      institution.campuses.create(code: Faker::Alphanumeric.alphanumeric(number: 5).upcase,
                                  name: name, description: "#{institution.name} #{name}",
                                  status: @status)
    end
  end
end

def create_educative_levels
  path = 'db/external_data/educative_levels.csv'
  CSV.foreach(path, headers: true) do |row|
    EducativeLevel.create(code: row['code'], name: row['name'],
                          description: row['description'], status: @status)
  end
end

def create_careers
  path = 'db/external_data/careers.csv'
  CSV.foreach(path, headers: true) do |row|
    Career.create(code: row['code'], name: row['name'],
                  description: row['description'], status: @status)
  end
end

def create_syllabuses
  path = 'db/external_data/syllabuses.csv'
  CSV.foreach(path, headers: true) do |row|
    Syllabus.create(code: row['code'], name: row['name'],
                    description: row['description'],
                    approval_credits: row['credits'], status: @status)
  end
  Career.where.not(code: 'GEN').each do |career|
    ((rand * 2) + 1).floor.times do
      year = (2000..2020).to_a.sample
      Syllabus.create(code: "#{career.code}#{year}",
                      name: "#{career.name} #{year}",
                      description: "Plan de Estudios #{career.name} México #{year}",
                      approval_credits: 800, status: @status)
    end
  end
end

def create_grades
  grades = %w[Primer Segundo Tercer Cuarto Quinto Sexto Septimo Octavo Noveno
              Decimo Onceavo Doceavo]
  grades.each_with_index do |grade, index|
    Grade.create(code: index + 1, name: grade, description: "#{grade} grado",
                 status: @status)
  end
end

def create_courses
  Course.delete_all
  150.times do
    name = Faker::Educator.course_name
    code = "#{name[0..2].upcase}#{name.match(/\d+/)[0]}"
    Course.create(code: code, name: name, description: name, credits: 10,
                  status: @status)
  end
end

def create_cycle_types
  CycleType.delete_all
  path = 'db/external_data/cycle_types.csv'
  CSV.foreach(path, headers: true) do |row|
    CycleType.create(code: row['code'], name: row['name'],
                     description: row['description'],
                     duration: row['duration'], status: @status)
  end
end

def create_academic_cycles
  AcademicCycle.delete_all
  CycleType.all.where(status: 1).each do |cycle_type|
    years = (2015..2019)
    years.each do |year|
      cycles_per_year = (360 / cycle_type.duration).floor
      start_month = Date::MONTHNAMES.index('August')
      start_date = Date.new(year, start_month, 1)

      cycles_per_year.times do
        finish_date = start_date + cycle_type.duration.days
        code = AcademicCycle.create_code(cycle_type, start_date)
        name = "Ciclo #{cycle_type.name} #{start_date.strftime('%b%Y')} - #{finish_date.strftime('%b%Y')}"

        cycle_type.academic_cycles.create(code: code, name: name,
                                          description: name,
                                          status: @status,
                                          start: start_date,
                                          finish: finish_date)
        start_date = finish_date + 1.day
      end
    end
  end
end

def create_modalities
  path = 'db/external_data/modalities.csv'
  CSV.foreach(path, headers: true) do |row|
    Modality.create(code: row['code'], name: row['name'],
                    description: row['description'], status: @status)
  end
end

Faker::Config.locale = 'es-MX'
@status = Status.where(code: 'ACT').first
create_users if false
create_countries if false
create_statuses if false
create_institutions if false
create_campuses if false
create_educative_levels if false
create_careers if false
create_syllabuses if false
create_grades if false
create_courses if false
create_cycle_types if false
create_academic_cycles if false
create_modalities if true
