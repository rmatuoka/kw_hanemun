ActionController::Routing::Routes.draw do |map|
  map.resources :quotes
  map.resources :infos
  map.resources :hairs
  map.resources :scrapbooks
  map.resources :messages
  map.resources :user_sessions
  map.resources :users
  map.resources :home
  map.resources :transactions
  map.resources :mensagens
  map.resources :cerimonias
  map.resources :albums do |album|
    album.resources :fotos
  end
  
  map.resources :packages do |package|
    package.resources :quotes
  end
  
  map.resources :carrinho, :singular => :carrinho_item, :new => {:transaction => :post}, :collection => {:remover => :get, :finalizar => :get}, :member => {:adicionar => :get, :excluir => :get}
  map.resources :hotels
  
  map.resources :teste
  map.resources :presencas
  
  map.resources :fotos, :collection => { :ajax => :get, :remover =>:get}
  map.resources :payments, :collection => {:efetuado => :post}
  map.resources :lista, :singular => :lista_item
  map.resources :recepcao, :singular => :recepcao_local
  
  
  map.login "login", :controller => "user_sessions", :action => "new" 
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.root :controller => "home"
  map.connect ":user", :controller => "home", :action => "index"
end
