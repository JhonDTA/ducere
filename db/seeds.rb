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

def create_buildings
  Campus.all.each do |campus|
    ((rand * 3) + 1).floor.times do
      code = Faker::Alphanumeric.alphanumeric(number: 2, min_alpha: 1,
                                              min_numeric: 1).upcase
      campus.buildings.create(code: code, description: "Edificio #{code}",
                              status: @status)
    end
  end
end

def create_classrooms
  Building.all.each do |building|
    ((rand * 4) + 2).floor.times do |n|
      code = "#{building.code}-#{n + 1}"
      building.classrooms.create(code: code, description: "Salon #{code}",
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
  200.times do
    name = Faker::Educator.course_name
    code = "#{name[0..2].upcase}#{name.match(/\d+/)[0]}"
    Course.create(code: code, name: name, description: name, credits: 10,
                  status: @status)
  end
end

def create_cycle_types
  path = 'db/external_data/cycle_types.csv'
  CSV.foreach(path, headers: true) do |row|
    CycleType.create(code: row['code'], name: row['name'],
                     description: row['description'],
                     duration: row['duration'], status: @status)
  end
end

def create_academic_cycles
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

def create_turns
  path = 'db/external_data/turns.csv'
  CSV.foreach(path, headers: true) do |row|
    Turn.create(code: row['code'], name: row['name'],
                description: row['description'], start: row['start'],
                finish: row['finish'], status: @status)
  end
end

def create_evaluation_periods
  periods = %w[Primer Segundo Tercer Cuarto Quinto Sexto Septimo Octavo Noveno
               Decimo Onceavo Doceavo]
  periods.each_with_index do |grade, index|
    EvaluationPeriod.create(code: index + 1, name: grade,
                            description: "#{grade} periodo de evaluación",
                            status: @status)
  end
end

def create_relationships
  path = 'db/external_data/relationships.csv'
  CSV.foreach(path, headers: true) do |row|
    Relationship.create(name: row['name'], status: @status)
  end
end

def create_groups
  group_letters = %w[A B C D]
  group_letters.each do |group_letter|
    Group.create(code: group_letter, name: "Grupo #{group_letter}",
                 description: "Grupo #{group_letter}", status: @status)
  end
end

def create_level_careers
  path = 'db/external_data/level_careers.csv'
  CSV.foreach(path, headers: true) do |row|
    level = EducativeLevel.find_by(code: row['level'])
    career = Career.find_by(code: row['career'])
    LevelCareer.create(educative_level: level, career: career)
  end
  level = EducativeLevel.find_by(code: 'LIC')
  careers = Career.where.not(code: 'GEN')
  careers.each { |career| LevelCareer.create(educative_level: level, career: career) }
end

def create_career_syllabuses
  path = 'db/external_data/career_syllabuses.csv'
  CSV.foreach(path, headers: true) do |row|
    level = EducativeLevel.find_by(code: row['level'])
    career = Career.find_by(code: row['career'])
    syllabus = Syllabus.find_by(code: row['syllabus'])
    lc = LevelCareer.find_by(educative_level: level, career: career)
    CareerSyllabus.create(level_career: lc, syllabus: syllabus)
  end
  syllabuses = Syllabus.all
  level = EducativeLevel.find_by(code: 'LIC')
  syllabuses.each do |syllabus|
    code = syllabus.code.match(/\D+/)[0]
    careers = Career.where(code: code)
    careers.each do |career|
      lc = LevelCareer.find_by(educative_level: level, career: career)
      CareerSyllabus.create(level_career: lc, syllabus: syllabus)
    end
  end
end

def create_syllabus_grades
  path = 'db/external_data/syllabus_grades.csv'
  CSV.foreach(path, headers: true) do |row|
    career_syllabuses = CareerSyllabus.joins(level_career: :educative_level).where(educative_levels: { code: row['level'] })
    grades = row['grades'].to_i
    grades.times do |n|
      career_syllabuses.each do |career_syllabus|
        grade = Grade.find_by(code: "#{n + 1}")
        SyllabusGrade.create(career_syllabus: career_syllabus, grade: grade)
      end
    end
  end
end

def create_grade_courses
  courses = Course.all
  SyllabusGrade.all.each do |syllabus_grade|
    (5..10).to_a.sample.times do
      course = courses.sample
      GradeCourse.create(syllabus_grade: syllabus_grade, course: course)
    end
  end
end

def create_students
  User.all.each do |user|
    enrollment = Faker::Alphanumeric.alphanumeric(number: 8).upcase
    Student.create(user: user, enrollment: enrollment)
  end
end

def create_professors
  users = User.all
  50.times do
    user = users.sample
    enrollment = Faker::Alphanumeric.alphanumeric(number: 6).upcase
    professor = Professor.create(user: user, enrollment: enrollment)
    redo unless professor.valid?
  end
end

def create_professor_courses
  courses = Course.all
  Professor.all.each do |professor|
    course = courses.sample
    ProfessorCourse.create(professor: professor, course: course)
  end
end

def create_parents
  50.times do
    user = User.order(Arel.sql('RANDOM()')).first
    parent = Parent.create(user: user)
    redo unless parent.valid?
  end
end

def create_tutors
  relationships = Relationship.all
  parents = Parent.all
  Student.all.each do |student|
    parent = parents.sample
    relationship = relationships.sample
    Tutor.create(student: student, parent: parent, relationship: relationship)
  end
end

def create_cycle_modalities
  modality = Modality.find_by(code: 'ESC')
  AcademicCycle.where(status: Status.where(code: 'ACT')).each do |academic_cycle|
    CycleModality.create(academic_cycle: academic_cycle, modality: modality)
  end
end

def create_cycle_turns
  turns = Turn.where(code: %w[MAT VES])
  CycleModality.all.each do |cycle_modality|
    turns.each do |turn|
      CycleTurn.create(cycle_modality: cycle_modality, turn: turn)
    end
  end
end

def create_evaluation_periods
  cycle_turns = CycleTurn.joins(cycle_modality: :academic_cycle).where(academic_cycles: { start: Date.new(2019, 8, 1) })
  cycle_turns.each do |cycle_turn|
    cycle_modality = cycle_turn.cycle_modality
    academic_cycle = cycle_modality.academic_cycle
    cycle_type = academic_cycle.cycle_type
    duration = cycle_type.duration
    evaluations = duration / 60

    evaluations.times do |n|
      evaluation_period = EvaluationPeriod.find_by(code: "#{n + 1}")
      TurnEvaluation.create(cycle_turn: cycle_turn, evaluation_period: evaluation_period)
    end
  end
end

def create_campus_evaluations
  institution = Institution.first
  campus = institution.campuses.first
  turn_evaluations = TurnEvaluation.joins(cycle_turn: {
      cycle_modality: {
          academic_cycle: :cycle_type } }).where(cycle_types: { code: 'CUAT' })
  turn_evaluations.each do |turn_evaluation|
    CampusEvaluation.create(campus: campus, turn_evaluation: turn_evaluation)
  end
end

Faker::Config.locale = 'es-MX'
@status = Status.where(code: 'ACT').first
create_users if false
create_countries if false
create_statuses if false
create_institutions if false
create_campuses if false
create_buildings if false
create_classrooms if false
create_educative_levels if false
create_careers if false
create_syllabuses if false
create_grades if false
create_courses if false
create_cycle_types if false
create_academic_cycles if false
create_modalities if false
create_turns if false
create_evaluation_periods if false
create_relationships if false
create_groups if false
create_level_careers if false
create_career_syllabuses if false
create_syllabus_grades if false
create_grade_courses if false
create_students if false
create_professors if false
create_professor_courses if false
create_parents if false
create_tutors if false
create_cycle_modalities if false
create_cycle_turns if false
create_evaluation_periods if false
create_campus_evaluations if false
