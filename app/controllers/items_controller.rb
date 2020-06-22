class ItemsController < ApplicationController

    def new 
        # binding.pry
        @list = current_user.lists.find_by_id(params[:list_id])
        @item = @list.items.build
    end

    def create 
        @list = current_user.lists.find_by_id(params[:list_id])
        @item = @list.items.create(item_params)
        if  @item.save
            redirect_to lists_path(@list.id)
        else 
            render edit_list_item_path(@list)
        end
    end

    def destroy
        @item = Item.find_by(id: params[:id])
        @list = current_user.lists.find_by_id(params[:list_id])
        @item.destroy
        redirect_to lists_path(params[@list])
    end

    private 

    def item_params
        params.require(:item).permit(:description, :checked_off)
    end


end
