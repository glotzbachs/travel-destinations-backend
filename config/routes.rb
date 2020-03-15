Rails.application.routes.draw do

  resources :destinations do
    resources :attractions
  end

  # resources :attractions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
