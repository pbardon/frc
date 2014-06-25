Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :users do 
    resources :contacts, only: :index do
      collection do
        get 'favorites'
      end
    end 
  end
  resources :contacts, only: [:create, :destroy, :show, :update]
  resources :contact_shares, only: [:create, :destroy]

  resources :contacts do
    resources :comments
  end

  resources :users do
    resources :comments
  end
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:id/edit' => 'users#edit' , :as => 'edit_user'
  get 'users/:id' => 'users#show'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  
end
