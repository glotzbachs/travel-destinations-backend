Rails.application.routes.draw do

  resources :attractions
  
  resources :destinations do
    resources :attractions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
