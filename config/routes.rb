Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :blogs, except: [:show]
  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root "records#index"

  get 'says/:slug', to: 'entries#show'
end
