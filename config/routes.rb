Rails.application.routes.draw do
  get 'books/new'
  root :to => 'homes#top'
  resources :books
end
