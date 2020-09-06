# frozen_string_literal: true

require 'csv'
require 'faker'

def create_statuses
  CSV.foreach('db/external_data/statuses.csv', headers: true) do |row|
    Status.create(code: row['code'], name: row['name'],
                  description: row['description'])
  end
end

def create_users
  User.create(first_name: 'John', last_name: 'Doe', second_last_name: 'Toe',
              email: 'foo@bar.com', password: 'password',
              password_confirmation: 'password', confirmed_at: Time.zone.now)
  299.times do |n|
    user = User.new(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    second_last_name: Faker::Name.last_name,
                    email: "foo#{n}@bar.com", password: 'password',
                    password_confirmation: 'password',
                    confirmed_at: Time.zone.now)
    user.save!(validate: false)
  end
end

def create_countries
  CSV.foreach('db/external_data/countries.csv', headers: true) do |row|
    Country.create(name: row['nombre'], iso_code: row['iso3'],
                   calling_code: row['phone_code'])
  end
end

def create_settlements
  country = Country.find_by(iso_code: 'MEX')
  memo = { states: [] }
  CSV.foreach('db/external_data/zip_codes.txt', headers: true, col_sep: '|') do |row|
    state_name = row['d_estado']
    memo_state = memo[:states].detect { |e| e[:name].eql?(state_name) }
    state = memo_state.blank? ? State.create(country_id: country.id, name: state_name) : nil
    memo[:states] << { id: state.id, name: state.name } if state.present?
    memo_state = memo[:states].detect { |e| e[:name].eql?(state_name) }
    memo_state[:municipalities] = [] if memo_state[:municipalities].blank?

    municipality_name = row['D_mnpio']
    memo_municipality = memo_state[:municipalities].detect { |e| e[:name].eql?(municipality_name) }
    municipality = memo_municipality.blank? ? Municipality.create(state_id: memo_state[:id], name: municipality_name) : nil
    memo_state[:municipalities] << { id: municipality.id, name: municipality.name } if municipality.present?
    memo_municipality = memo_state[:municipalities].detect { |e| e[:name].eql?(municipality_name) }
    memo_municipality[:settlements] = [] if memo_municipality[:settlements].blank?

    set_name = row['d_asenta']
    zip_code = row['d_codigo']
    memo_set = memo_municipality[:settlements].detect { |e| e[:name].eql?(set_name) }
    settlement = memo_set.blank? ? Settlement.create(municipality_id: memo_municipality[:id], name: set_name, zip_code: zip_code) : nil
    memo_municipality[:settlements] << { id: settlement.id, name: settlement.name } if settlement.present?
  end
end

def create_institutions
  30.times do
    Institution.create(code: Faker::Alphanumeric.alphanumeric(number: 10).upcase,
                       name: Faker::University.name,
                       description: Faker::Lorem.paragraph(sentence_count: 2),
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
  educative_levels = EducativeLevel.all
  CSV.foreach(path, headers: true) do |row|
    educative_level = educative_levels.detect { |el| el.code.eql?(row['level']) }
    Career.create(code: row['code'], name: row['name'],
                  description: row['description'],
                  educative_level: educative_level, status: @status)
  end
end

def create_syllabuses
  Career.all.each do |career|
    ((rand * 2) + 1).floor.times do
      year = (2000..2020).to_a.sample
      Syllabus.create(career: career, code: "#{career.code}#{year}",
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
    Grade.create(name: grade, sequence: index + 1, description: "#{grade} grado",
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

def create_currencies
  CSV.foreach('db/external_data/currencies.csv', headers: true) do |row|
    Currency.create(name: row['name'], iso_code: row['iso_code'],
                    symbol: row['symbol'])
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

def create_syllabus_grades
  path = 'db/external_data/syllabus_grades.csv'
  CSV.foreach(path, headers: true) do |row|
    syllabuses = Syllabus.joins(career: :educative_level)
                         .where(educative_levels: { code: row['level'] })
    grades = row['grades'].to_i
    grades.times do |n|
      syllabuses.each do |syllabus|
        grade = Grade.find_by(code: (n + 1).to_s)
        SyllabusGrade.create(syllabus: syllabus, grade: grade)
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
  users = User.all
  50.times do
    user = users.sample
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

def create_turn_evaluations
  cycle_turns = CycleTurn.joins(cycle_modality: :academic_cycle)
                         .where(academic_cycles: { start: Date.new(2019, 8, 1) })
  cycle_turns.each do |cycle_turn|
    cycle_modality = cycle_turn.cycle_modality
    academic_cycle = cycle_modality.academic_cycle
    cycle_type = academic_cycle.cycle_type
    duration = cycle_type.duration
    evaluations = duration / 60

    evaluations.times do |n|
      evaluation_period = EvaluationPeriod.find_by(code: (n + 1).to_s)
      TurnEvaluation.create(cycle_turn: cycle_turn, evaluation_period: evaluation_period)
    end
  end
end

def create_campus_evaluations
  institution = Institution.first
  campus = institution.campuses.first
  turn_evaluations = TurnEvaluation.joins(cycle_turn: { cycle_modality: { academic_cycle: :cycle_type } })
                                   .where(cycle_types: { code: 'CUAT' })
  turn_evaluations.each do |turn_evaluation|
    CampusEvaluation.create(campus: campus, turn_evaluation: turn_evaluation)
  end
end

def create_course_evaluation
  grade_courses = GradeCourse.joins(syllabus_grade: [{ syllabus: :career }, :grade])
                             .where(careers: { code: 'ISC' },
                                    grades: { code: '1' })

  campus_evaluation = CampusEvaluation.joins(turn_evaluation:
                                                 [{ cycle_turn:
                                                        [{ cycle_modality: { academic_cycle: :cycle_type } },
                                                         :turn] },
                                                  :evaluation_period])
                                      .where(cycle_types: { code: 'CUAT' },
                                             academic_cycles: { start: Date.new(2019, 8, 1) },
                                             evaluation_periods: { code: '1' },
                                             turns: { code: 'MAT' }).first
  professors = Professor.all
  group = Group.first

  grade_courses.each do |grade_course|
    professor = professors.sample
    CourseEvaluation.create(grade_course: grade_course,
                            campus_evaluation: campus_evaluation,
                            professor: professor, group: group)
  end
end

def create_student_courses
  students = Student.all.take(40)
  course_evaluations = CourseEvaluation.all
  students.each do |student|
    course_evaluations.each do |course_evaluation|
      StudentCourse.create(student: student, course_evaluation: course_evaluation)
    end
  end
end

def create_course_marks
  student_courses = StudentCourse.all
  marks = (5..10).to_a
  attendances = (10..20).to_a
  student_courses.each do |student_course|
    observations = Faker::Lorem.paragraph(sentence_count: 2)
    CourseMark.create(student_course: student_course, mark: marks.sample,
                      attendance: attendances.sample, observations: observations)
  end
end

def create_course_homeworks
  course_evaluations = CourseEvaluation.all
  course_evaluations.each do |course_evaluation|
    (1..3).to_a.sample.times do
      name = "#{Faker::Educator.subject} in #{Faker::IndustrySegments.sub_sector}"
      description = Faker::Lorem.paragraph(sentence_count: 3)
      CourseHomework.create(course_evaluation: course_evaluation, name: name,
                            description: description)
    end
  end
end

def create_student_homeworks
  CourseHomework.all.each do |course_homework|
    course_evaluation = course_homework.course_evaluation
    course_students = course_evaluation.student_courses
    course_students.each do |course_student|
      student = course_student.student
      observations = Faker::Lorem.paragraph(sentence_count: 4)
      StudentHomework.create(course_homework: course_homework,
                             student: student,
                             observations: observations)
    end
  end
end

def create_homework_marks
  marks = (5..10).to_a
  StudentHomework.all.each do |student_homework|
    observations = Faker::Lorem.paragraph(sentence_count: 2)
    HomeworkMark.create(student_homework: student_homework,
                        mark: marks.sample, observations: observations)
  end
end

def create_attendance_types
  path = 'db/external_data/attendance_types.csv'
  CSV.foreach(path, headers: true) do |row|
    AttendanceType.create(code: row['code'], name: row['name'],
                          description: row['description'], status: @status)
  end
end

def create_evaluation_attendances
  student_courses = StudentCourse.all
  academic_cycle = AcademicCycle.find_by(code: 'CUA0819-1119')
  attendance_type = AttendanceType.first
  (academic_cycle.start..academic_cycle.finish).each do |date|
    student_courses.each do |student_course|
      student = student_course.student
      course_evaluation = student_course.course_evaluation
      EvaluationAttendance.create(student: student,
                                  course_evaluation: course_evaluation,
                                  attendance_type: attendance_type,
                                  date: date)
    end
  end
end

create_statuses
Faker::Config.locale = 'es-MX'
@status = Status.where(code: 'ACT').first
create_users
create_countries
create_institutions
create_campuses
create_buildings
create_classrooms
create_educative_levels
create_careers
create_syllabuses
create_grades
create_courses
create_currencies
create_cycle_types
create_academic_cycles
create_modalities
create_turns
create_evaluation_periods
create_relationships
create_groups
create_syllabus_grades
create_grade_courses
create_students
create_professors
create_professor_courses
create_parents
create_tutors
create_cycle_modalities
create_cycle_turns
create_turn_evaluations
create_campus_evaluations
create_course_evaluation
create_student_courses
create_course_marks
create_course_homeworks
create_student_homeworks
create_homework_marks
create_attendance_types
# create_settlements
# create_evaluation_attendances
