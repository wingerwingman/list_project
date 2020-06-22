class ItemsController < ApplicationController

    def new 
        @list = current_user.lists.find_by_id(params[:list_id])
        @item = @list.items.build
    end

    def create 
        @list = current_user.lists.find_by_id(params[:list_id])
        @item = @list.items.create(item_params)
        if  @item.save
            redirect_to list_path(@list)
        else 
            render edit_list_item_path(@list)
        end
    end

    def destroy
        @item = Item.find_by(id: params[:id])
        @list = @item.list_id
        @item.destroy
        redirect_to list_path(@list)
    end

    private 

    def item_params
        params.require(:item).permit(:description, :checked_off)
    end


end
