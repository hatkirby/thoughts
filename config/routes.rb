Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :blogs, except: [:show]

    resources :streams, except: [:show] do
      resources :updates, except: [:index, :show]
    end
  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root "records#index"

  get 'says/:slug', to: 'blogs#show'

  get 'thinks/:slug', to: 'streams#show'

  mount Pokeviewer::Engine => '/poke3'
end
