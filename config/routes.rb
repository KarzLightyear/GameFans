Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  scope module: 'public' do
    root 'homes#top'
    get 'about', to: 'homes#about'
    scope 'genres/:genre_id' do
      resources :games, only:[:create,:show,:edit,:update,:destroy] do
        resources :game_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end  
    end

    resources :genres, only:[:index, :show]
    resources :users, only:[:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    post 'games/:id' => 'games#show'
    
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
  end

  namespace :admin do
    root 'homes#top'
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
  end


end
