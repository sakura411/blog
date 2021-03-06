Rails.application.routes.draw do
  get 'welcome/index' => 'welcome#index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index' # localhost:3000

  get '/articles' => 'articles#index'
  get '/articles/:id' => 'articles#show'
  post '/articles/:id' => 'articles#show'
  delete '/article/destroy/:id' => 'articles#destroy'
  #delete '/articles/comments/:id' => 'comments#destroy'
  #delete '/articles/:id' => 'articles#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
