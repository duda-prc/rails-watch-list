Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :lists, only: %i[new create show index update edit] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: %i[create]
  end

  resources :movies, only: [:index]
  resources :bookmarks, only: [:destroy]
  root to: 'lists#index'
end
