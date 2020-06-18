class ListsController < ApplicationController

    def index 
        @user = current_user
        @lists = @user.lists.all
    end

    def new
        @list = current_user.lists.build
    end

    def create 
        
        @list = current_user.lists.build(list_params)
        if @list.save 
            redirect_to list_path(@list)
        else
            render 'new', :alert => "Please Fill In All The Forms"
        end
    end

    def show 
        @list = List.find_by(params[:id])
        # binding.pry
        @item = @list.items.create(description: :description, checked_off: :checked_off)
    end

    private 

    def list_params 
        params.require(:list).permit(:user_id, :name, :category_id, :description, category_attributes: [
            :name])
    end
    
end
