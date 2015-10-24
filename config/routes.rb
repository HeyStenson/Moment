Rails.application.routes.draw do
  get 'users/show'

  # get 'users/edit'

  get 'users/update'

  root to: 'welcome#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    resources :journals do
      resources :moments
    end  
  end  

end
