Mworkshop::Application.routes.draw do

  root :to => 'home#index'

  namespace :api do
    namespace :v1 do
      resources :students
      resources :groups
      resources :grades, only: :index
    end
  end

end
