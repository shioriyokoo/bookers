Rails.application.routes.draw do
  get 'books/new'
  root :to => 'homes#top'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/show'
  get 'books/edit'
  get 'books/:id' => 'books#show', as: 'book'
end
