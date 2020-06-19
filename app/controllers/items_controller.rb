class ItemsController < ApplicationController

    def new 
        @list = current_user.lists.find_by(id: params[:list_id])
        @item = @list.items.build
    end

    def create 
        @item = @list.build_item(item_params)
        if  @item.save
            redirect_to list_path(@list)
        else 
            render new_list_item
        end
    end

    def show
        binding.pry
    end

    private 

    def item_params
        params.require(:item).permit(:description, :checked_off)
    end


end
