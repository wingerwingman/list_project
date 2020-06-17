class ListsController < ApplicationController

    def index 
        @lists = List.all 
    end

    def new
        binding.pry
        @list = List.new
    end

    def create 

    end


    private 

    def list_params 
        parms.require(:user_id, :name, :category_id, :description)
    end
end
