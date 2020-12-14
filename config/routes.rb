Rails.application.routes.draw do
  resources :tags
  resources :treatments
  resources :appointments
  resources :shareds
  resources :exams
  devise_for :users
  resources :users, except: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      get "/users/sign_out" => "devise/sessions#destroy"
      get "/search", to: "search#index"
    end

    unauthenticated do
      root "devise/registrations#new", as: :unauthenticated_root
      get "about", to: "home#about"
    end
  end

  root "home#index"
end
