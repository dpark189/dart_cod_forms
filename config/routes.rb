Rails.application.routes.draw do
  root to: "static_pages#root"
  get '/by_date', to: 'static_pages#accounts_by_date', as: 'accounts_by_date'
  devise_for :users
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
