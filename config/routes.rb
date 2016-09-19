Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :machine_data
  resources :users do
    get ':id/machine_data' => 'users#machine_data', on: :collection, as: 'machine_data'
  end
  resources :companies do
    get ':id/users' => 'companies#users', on: :collection, as: 'users'
  end
  root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
