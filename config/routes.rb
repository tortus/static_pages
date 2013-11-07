StaticPages::Engine.routes.draw do

  match ':page(.:format)' => 'pages#show', :as => :page, :via => :get
  root :to => 'pages#index'

end
