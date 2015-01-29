Mworkshop::Application.routes.draw do

  get 'import/new'

  post 'import/create'

  root :to => 'home#index'

  namespace :api do
    namespace :v1 do
      resources :students
      resources :periods
      resources :groups
      resources :workshops
      resources :enums, only: :index
    end
  end

end
