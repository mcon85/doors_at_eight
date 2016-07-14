Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resources :homepage, only: [:index]

  resources :admin do
    resources :users, only: [:index]
  end

  namespace :api do
    resources :reviews, only: [:index, :create] do
      resources :votes, only: [:index, :create], controller: 'reviews/votes'
    end
    resources :venues, only: [] do
      resources :reviews, only: [:index], controller: 'venues/reviews'
    end
  end

  resources :venues, only: [:index,
                            :show,
                            :new,
                            :edit,
                            :create,
                            :update,
                            :destroy] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews, only: [:show, :edit, :update, :destroy] do
    resources :votes, only: [:create]
  end
end
