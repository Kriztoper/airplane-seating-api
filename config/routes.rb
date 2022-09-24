Rails.application.routes.draw do
  resources :airplanes
  resources :seats
  post 'seats/assign-to-passengers', to: 'seats#assign_seats'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
