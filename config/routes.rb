Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :routes, only: [:show]
  resource :highlights, only: [:show]
end
