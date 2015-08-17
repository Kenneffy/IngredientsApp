Rails.application.routes.draw do
  root 'users#new'

  get 'ingredients_recipes/index' => 'ingredients_recipes#index'
  get '/ingredients_recipes/search' => 'ingredients_recipes#search'
  get '/ingredients_recipes/:id' => 'ingredients_recipes#show'
  post '/ingredients_recipes' => 'ingredients_recipes#create'

  post '/user_tries' => 'user_tries#create'

  get 'comments/:ingredients_recipe_id' => 'comments#index'
  post 'comments' => 'comments#create'


  resources :users, only: [:new, :create, :show, :destroy]

  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'
end
