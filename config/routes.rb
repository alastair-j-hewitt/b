Rails.application.routes.draw do
  # get 'pages/home'
  # get 'pages/scanner'
  # get 'pages/confirmation'
  # get 'pages/pin'
  # get 'pages/summary'
  # get 'pages/t1'
  # get 'pages/t2'
  # get 'pages/t3'


  get 'about', to: 'pages#about', as: :about
  get 'home', to: 'pages#home', as: :home
  get 'scanner', to: 'pages#scanner', as: :scanner
  get 'confirmation', to: 'pages#confirmation', as: :confirmation
  get 'pin', to: 'pages#pin', to: :pin
  get 'summary', to: 'pages#summary', to: :summary
  get 't1', to: 'pages#t1', to: :t1
  get 't2', to: 'pages#t2', to: :t2
  get 't3', to: 'pages#t3', to: :t3
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

