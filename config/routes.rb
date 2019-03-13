Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :blogs do
      collection do
        get 'drafts'
      end
    end

    resources :streams, except: [:show] do
      resources :updates, except: [:index, :show]
    end

    resources :links, except: [:show]

    resources :games, except: [:show]
  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root "records#index"

  get 'says/:slug', to: 'blogs#show', as: :blog

  get 'thinks/:slug', to: 'streams#show', as: :stream

  get 'plays', to: 'games#index'

  resources :tags, only: [], param: :name do
    collection do
      get 'suggest'
    end
  end

  mount Pokeviewer::Engine => '/poke3'
end
