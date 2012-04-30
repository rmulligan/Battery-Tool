BatteryCalc::Application.routes.draw do
  resources :users

  get "calculate/crunch"

  get "guis/index"
  get "guis/tool_index"
  root :to => 'guis#tool_index'
  match 'calculate/crunch' => 'calculate#crunch'
  match 'battery_calc' => 'guis#index'
end
