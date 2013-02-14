StaticPages::Engine.routes.draw do

  match ':page(.:format)' => 'pages#show', :as => :page
  root :to => 'pages#index'

end
