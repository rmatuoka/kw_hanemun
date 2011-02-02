class ListaController < ApplicationController
    before_filter :autentica, :load_box_package
    
end
