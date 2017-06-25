Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "records#index"

  get 'says/:slug', to: 'entries#show'

  # get ':directory/:slug', to: 'entries#show', constraints: lambda { |request|
  #   Entry::DIRECTORIES.include? request.path_parameters['directory']
  # }
end
