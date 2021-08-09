Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  scope module: 'public' do
    root 'homes#top'
    get 'about', to: 'homes#about'

    resources :games, only:[:index,:new,:create,:show,:edit,:update,:destroy]
    get 'list', to: 'games#list'
  end

  namespace :admin do
    root 'admin/sessions#new'
    resources :genres, only:[:index,:create,:edit,:update]
  end

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
end
