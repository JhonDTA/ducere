# frozen_string_literal: true

Rails.application.routes.draw do
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
  resources :career_syllabuses
  resources :level_careers
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  devise_for :user
  resources :countries
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
end
