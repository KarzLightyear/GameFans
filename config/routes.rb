Rails.application.routes.draw do
  namespace :public do
    get 'searches/search'
  end
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  scope module: 'public' do
    root 'homes#top'
    get 'about', to: 'homes#about'
    get 'searches/search'
    scope 'genres/:genre_id' do
      resources :games, only: %i[create show edit update destroy] do
        resources :game_comments, only: %i[create destroy]
        resource :favorites, only: %i[create destroy]
      end
    end

    resources :genres, only: %i[index show]
    resources :users, only: %i[index show edit update] do
      resource :relationships, only: %i[create destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      put '/users/:id/hide' => 'users#hide', as: 'users_hide'
    end
    post 'games/:id' => 'games#show'

    resources :contacts, only: %i[new create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
  end

  namespace :admin do
    root 'homes#top'
    resources :genres, only: %i[index create edit update destroy]
  end
end
