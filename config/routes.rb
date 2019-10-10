Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :combinations

  resources :ingredients, only: [:index, :create, :destroy]
  resources :seasonings,  only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
