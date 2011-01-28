ActionController::Routing::Routes.draw do |map|
  map.resources :quotes
  map.resources :infos
  map.resources :hairs
  map.resources :scrapbooks
  map.resources :messages
  map.resources :user_sessions
  map.resources :users
  map.resources :home
  map.resources :albums do |album|
    album.resources :fotos
  end
  
  map.resources :packages do |package|
    package.resources :quotes
  end
  
  map.resources :carrinho, :singular => :carrinho_item, :collection => {:adicionar => :get, :remover => :get, :finalizar => :get}, :member => {:excluir => :get}
  map.resources :hotels
  map.resources :fotos, :collection => { :ajax => :get}
  map.resources :payments, :collection => {:efetuado => :post}
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.root :controller => "home"
  map.connect ":user", :controller => "home", :action => "index"
end
