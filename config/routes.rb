Rails.application.routes.draw do

  scope module: 'public' do
    root 'homes#top'
    get 'about', to: 'homes#about'

    resources :games, only:[:index,:new,:create,:show,:edit,:update,:destroy]
    get 'list', to: 'games#list'
  end

  namespace :admin do
    root 'homes#top'
    resources :genres, only:[:index,:create,:edit,:update,:destroy]
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
