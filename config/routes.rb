Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: 'public' do
    root 'homes#top'
    get 'about', to: 'homes#about'
    scope 'genres/:genre_id' do
      resources :games, only:[:create,:show,:edit,:update,:destroy]
    end
#    scope 'genres/:genre_id/games/:game_id' do
#      resources :comments, only[:create, :show, :edit, :update, :destroy]
#    end

    resources :genres, only:[:index, :show]
    resources :customers, only:[:index,:show,:edit,:update]
    post 'games/:id' => 'games#show'
  end

  namespace :admin do
    root 'homes#top'
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
  end


end
