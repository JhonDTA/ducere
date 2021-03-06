# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  resources :channels do
    resource :channel_user
    resources :messages
  end

  devise_for :user
  resources :countries
  resources :states
  resources :municipalities
  resources :settlements
  resources :addresses
  resources :relationships
  resources :attendance_types
  resources :groups
  resources :evaluation_periods
  resources :turns
  resources :modalities
  resources :academic_cycles
  resources :cycle_types
  resources :courses
  resources :grades
  resources :syllabuses
  resources :careers
  resources :educative_levels
  resources :classrooms
  resources :buildings
  resources :campuses
  resources :institutions
  resources :statuses
  resources :currencies

  resources :homework_marks
  resources :student_homeworks
  resources :course_homeworks
  resources :student_courses
  resources :course_marks
  resources :evaluation_attendances
  resources :tutors
  resources :parents
  resources :students
  resources :course_evaluations
  resources :professors
  resources :campus_evaluations
  resources :turn_evaluations
  resources :cycle_turns
  resources :cycle_modalities
  resources :grade_courses
  resources :syllabus_grades
  resources :professor_courses
  resources :user_addresses
  resources :campus_addresses
  resources :institution_addresses
end
