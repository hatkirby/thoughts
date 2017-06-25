Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "records#index"

  get 'says/:slug', to: 'entries#show'

  # get ':directory/:slug', to: 'entries#show', constraints: lambda { |request|
  #   Entry::DIRECTORIES.include? request.path_parameters['directory']
  # }
end
