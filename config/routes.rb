Rails.application.routes.draw do
  resources :books
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/books')
resources :suggestions
  get "suggestions/new" => "suggestions#new", as: "suggestions/new"
  resources :availability_notifications
  resources :checkouts
  get "checkout_new" => "checkouts#new", as: "checkout_new"
  post 'checkouts/:id/return' => 'checkouts#return', :as => 'checkout_return'
  resources :books
  post 'books/:id/issue' => 'books#issue', :as => 'book_issue'
  get "checkout_history" => "checkouts#history", as: "checkout_history"
  get "book_search" => "books#search", as: "book_search"
  post "book_search" => "books#search_results", as: "book_search_results"
  resources :conversations do
    resources :messages
  end
end
