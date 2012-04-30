BatteryCalc::Application.routes.draw do
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :users

  get "calculate/crunch"

  get "guis/index"
  get "guis/tool_index"
  root :to => 'guis#tool_index'
  match 'calculate/crunch' => 'calculate#crunch'
  match 'battery_calc' => 'guis#index'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
end
