Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  resources :games, only: [:index, :show]
  resources :results
  resources :questions
  resources :answers
  resources :users, only: [:show, :edit]

  get 'graph/index'
  get 'graph/data', defaults: { format: 'json' }

  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
