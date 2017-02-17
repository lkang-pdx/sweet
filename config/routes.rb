Rails.application.routes.draw do
  resources :pins
  devise_for :users
  get ':username' => 'users#show', as: 'user'
  root 'welcome#index'
end
