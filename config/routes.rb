Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, :contollers => {
    :regstrations => 'users/registrations'
    # :sessions => 'users/sessions'
  }
  root to: 'toppages#index'
  resources :diaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
