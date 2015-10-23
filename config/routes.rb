Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  devise_for :users

  resources :journals do
    resources :moments
  end  

end
