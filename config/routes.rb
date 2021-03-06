Rails.application.routes.draw do

  root to: 'welcome#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:destroy, :show] do
    resources :journals do
      resources :moments
    end  
  end   

end
