Rails.application.routes.draw do

  resources :stories do
    resources :votes do
    end
  end
  
  resource :session
    
end
