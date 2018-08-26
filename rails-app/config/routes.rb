Rails.application.routes.draw do
  resources :people_dates
  resources :candidates
  resources :event_people
  resources :events
  resources :kanjis
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
