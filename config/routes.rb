Rails.application.routes.draw do
  devise_for :users 
  
  root to: 'pages#home'
  resources :users do
    resources :bookings
  end
  resources :bookings do
    member do
      patch "update_status", to: 'bookings#update_status'
    end
    resources :user_bookings
    resources :reviews
    resources :payments
  end

  post 'booking-accepted/:id', to: 'bookings#booking_accepted', as: 'booking-accepted'
  get "dashboard", to: 'pages#dashboard'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
