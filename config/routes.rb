Rails.application.routes.draw do

  resources :wikis
  resources :wikis do
      resources :collaborations, only: [:new, :create, :destroy]
  end
  resources :charges, only: [:new, :create]
  resources :downgrade
  resources :collaborations

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
