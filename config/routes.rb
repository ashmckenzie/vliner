Vliner::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  namespace :api do
    resources :services, :only => [ :index, :show ]
    get "stations/:id/next", :controller => "stations", :action => "next", :as => 'station_next'
    resources :stations, :only => [ :index, :show ]
  end

  root :to => 'api/stations#index', :format => :json
end
