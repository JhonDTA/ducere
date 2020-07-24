# frozen_string_literal: true

Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  devise_for :user
  resources :countries
end
