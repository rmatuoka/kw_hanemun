class MensagensController < ApplicationController
    before_filter :autentica, :load_box_package

    def index
      @mensagens = @user.scrapbooks.paginate  :all, :page => params[:page], :per_page => 5
    end    
end
