Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # When server got incomming request from client with
  # HTTP method: [ GET, POST, PATCH, PUT, DELETE ]
  # server ( Rails app ) asks router to map it to controller's actions
  # some actions: [ index, show, new, edit, create, update, destroy ]
  # https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

  # ==================================================================
  # __Rails routes are matched in the order they are specified.__
  # ==================================================================

  # ==================================================================
  # __Resources should never be nested more than 1 level deep.__
  # https://guides.rubyonrails.org/routing.html#shallow-nesting
  # ==================================================================

  # ==================================================================
  # Reuses route with 'concern'
  # https://guides.rubyonrails.org/routing.html#routing-concerns
  # ==================================================================

  root "articles#index"

  # Replace 2 lines below with 'resources :articles"
  # and inspect what routes are mapped by "rails routes -g articles -E"
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  resources :articles

end
