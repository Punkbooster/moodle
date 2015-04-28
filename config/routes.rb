Rails.application.routes.draw do
  
  devise_for :users
    resources :courses do
    resources :announcements
  end

  root 'courses#index'
  
end
