class HomeController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    @mensagens = @user.scrapbooks.all
    
  end
end
