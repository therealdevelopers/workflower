Rails.application.routes.draw do

  get   'credits'           => 'pages#credits'

  get   'signin'            => 'sessions#new'

  post  'signin'            => 'sessions#create'

  get   'signout'           => 'sessions#destroy'

  get   'signup'            => 'users#new'

  post  'signup'            => 'users#create'

  get   'profile'           => 'users#show_profile'

  get   'profile/:username' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #concern :schedulable do
  #  resources :schedules, only: [:show, :edit, :update, :destroy, :new, :create] do
  #   collection do
  #      get 'list' => 'schedules#list'
  #    end
  #  end
  #end
  
  root :to => 'home#index'

  resources :users, only: [:edit, :update, :destroy] do
    resources :schedules, only: [:index, :show, :edit, :update, :destroy, :new, :create]
    collection do
      get 'groups' => 'users#groups'
    end
  end

  resources :groups, only: [:edit, :update, :destroy, :new, :create] do
    resources :schedules, only: [:index, :show, :edit, :update, :destroy, :new, :create]
    collection do
      get 'users' => 'groups#users'
    end
  end
  
end
