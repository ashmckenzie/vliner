Vliner::Application.routes.draw do

  namespace :api do
    resources :services, :only => [ :index, :show ]
    get "stations/:id/next", :controller => "stations", :action => "next", :as => 'station_next'
    resources :stations, :only => [ :index, :show ]
  end

  namespace :admin do
    resources :services
    resources :stations
  end

  root :to => 'services#index'
end
