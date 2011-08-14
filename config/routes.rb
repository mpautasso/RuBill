Rubill::Application.routes.draw do

  resources :csv_files do
    match "import", :via => "post"
  end
 
  resources :rates do 
  end

  resources :consults do  
      post 'filter_calls', :on => :collection
  end

  resources :invoices do 
    member do
      get :get_pdf
    end
  end
  
  resources :outgoing_calls do 
  end
  
  resources :incomming_calls do 
  end
  
  resources :failed_calls do 
  end
  
  resources :rates do 
  end
  
  root :to => 'home#index'
  
  match 'create_user', :to => "users#create", :via => "post"
  
  devise_for :users, :controllers => {
    :sessions => 'sessions',
    :registrations => 'registrations'
  }
  
  resources :users do
  end
  
  resources :devices do 
  end

end
