Rails.application.routes.draw do
  resources :books
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/books')
  resources :checkouts
  get "checkout_new" => "checkouts#new", as: "checkout_new"
  resources :books
end
