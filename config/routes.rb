# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.

  resources :wishes
  post 'wishes/:id/count_up_likes', to: 'wishes#count_up_likes', as: 'count_up_likes_wish'

  # Defines the root path route ("/")
  # root "posts#index"
end
