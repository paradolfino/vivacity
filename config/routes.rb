Rails.application.routes.draw do
  devise_for :users
  resources :sub_issues
  resources :issues
  resources :sprints
  resources :projects
  resources :team_members
  resources :teams
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
