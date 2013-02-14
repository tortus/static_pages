Rails.application.routes.draw do

  mount StaticPages::Engine => "/static_pages"
end
